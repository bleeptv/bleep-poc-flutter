import 'dart:async';

import 'package:bleep_flutter/bloc/homefeed/events/home-feed-event.dart';
import 'file:///C:/Users/asus/bleep/flutter/bleep_flutter/lib/bloc/homefeed/events/fetch-watch-parties-event.dart';
import 'package:bleep_flutter/bloc/homefeed/state/HomeFeedState.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:bleep_flutter/watchparty/repository/apiclient/watch-party-api-client.dart';
import 'package:bleep_flutter/watchparty/repository/entity/watch-party-entity.dart';
import 'package:bloc/bloc.dart';

///
/// Business Logic Component to manage the state of the Home feed
/// Consists of a [HomeFeedEvent[ object to capture events from the presentation layer
/// Outputs a [HomeFeedState] object containing the state of the home feed screen
class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {

  WatchPartyApiClient _watchPartyApiClient;
  List<WatchParty> _homeFeedCollection = List();

  HomeFeedBloc(WatchPartyApiClient watchPartyDataStore) : super(null) {
    this._watchPartyApiClient = watchPartyDataStore;
  }

  ///
  /// A method to get a list of watch parties triggered from the presentation layer
  void getWatchParties([bool isRefreshing = false]) {
    if(isRefreshing) {
      _homeFeedCollection.clear();
    }
    this.add(FetchWatchPartiesEvent());
  }

  ///
  ///Fetch a list of watch parties from the data layer
  ///Returns a future containing a list of [WatchParty] to the presentation layer
  Future<List<WatchParty>> _fetchWatchParties() async {
    List<WatchPartyEntity> watchPartyEntityCollection = await _watchPartyApiClient.fetchWatchParties();

   final watchParties = watchPartyEntityCollection.map((entity) {
      return this.mapEntityToDomain(entity);
    }).toList();
    return watchParties;
  }

  ///
  /// Reacts to specific events coming into the [HomeFeedBloc] and outputs a [HomeFeedState] accordingly
  /// [HomeFeedEvent] event object coming from the presentation layer
  /// Emit a state to the presentation layer (via the yield keyword)
  @override
  Stream<HomeFeedState> mapEventToState(HomeFeedEvent event) async* {
    if(event is FetchWatchPartiesEvent) {
      yield HomeFeedShowLoading(); // Outputs the state to show a loading bar

      List<WatchParty> watchParties;

      try {
        watchParties = await _fetchWatchParties();
        yield HomeFeedHideLoading();
      } catch (error) {
        yield HomeFeedHideLoading();
        yield HomeFeedShowError(error.toString());
        return;
      }

      _homeFeedCollection.addAll(watchParties);
      yield HomeFeedLoaded(_homeFeedCollection); // Outputs the state to show fetched watch parties
    }
  }

  ///
  /// Convert a [WatchPartyEntity] object to a [WatchParty] domain object
  /// [entityObject] A watch party entity object representing a watch party in the data layer
  /// Returns a [WatchParty] object
  WatchParty mapEntityToDomain(WatchPartyEntity entityObject) {
    WatchParty watchParty = WatchParty(
        entityObject.watchPartyId,
        "",
        "",
        entityObject.watchPartyBio.name,
        entityObject.watchPartyBio.description,
        0,
        0
    );
    return watchParty;
  }

  ///
  /// Dispose of the BLoC stream sink for the HomeFeedBloc
  void dispose(){
    this.close();
  }
}