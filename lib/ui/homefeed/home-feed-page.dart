import 'dart:async';

import 'package:bleep_flutter/bloc/homefeed/home-feed-bloc.dart';
import 'package:bleep_flutter/bloc/homefeed/state/HomeFeedState.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-cell.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:bleep_flutter/ui/home/destination-slider.dart';
import 'file:///C:/Users/asus/bleep/flutter/bleep_flutter/lib/ui/home/home_navigation_bar.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:bleep_flutter/watchparty/repository/apiclient/watch-party-api-client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeedScreen extends StatelessWidget {

  final String baseUrl = "https://limitless-coast-35282.herokuapp.com/";
  WatchPartyApiClient apiClient;
  HomeFeedBloc homeFeedBloc;

  @override
  Widget build(BuildContext context) {

    apiClient = BleepWatchPartyApiClient(baseUrl);

    return BlocProvider(
        create: (BuildContext context) => HomeFeedBloc(apiClient),
        child: HomeFeedPage(),
    );
  }
}

class HomeFeedPage extends StatefulWidget {

  @override
  _HomeFeedPageState createState () => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {

  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    BlocProvider.of<HomeFeedBloc>(context).getWatchParties(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeFeedBloc, HomeFeedState>(
        listener: (BuildContext context, HomeFeedState state) {
          if(state is HomeFeedShowLoading) {
            if(state is HomeFeedHideLoading) {
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
            }
          }
        },
        child: Scaffold(
          body: BlocBuilder<HomeFeedBloc, HomeFeedState>(
            builder: (BuildContext context, HomeFeedState state) {

              Widget currentScreen = Container();
            if(state is HomeFeedShowError) {
              currentScreen = buildErrorScreen(
                state.errorMessage, () {
                BlocProvider.of<HomeFeedBloc>(context).getWatchParties();
               }
              );
            }

            if(state is HomeFeedShowLoading) {
              currentScreen = buildLoadingIndicator();
            }

            if(state is HomeFeedLoaded) {
              currentScreen = buildWatchPartyFeed(state.fetchedWatchParties);
            }

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    DestinationSlider(),
                    currentScreen
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: HomeNavigationBar(),
        ),
    );
  }

  Widget buildWatchPartyFeed(List<WatchParty> watchParties) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<HomeFeedBloc>(context).getWatchParties(true);
          return _refreshCompleter.future;
        },
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: watchParties.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int position) {
              WatchParty currentWatchParty = watchParties.elementAt(position);
              return WatchPartyCell(
                  item: currentWatchParty
              );
            }),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildErrorScreen(String errorMessage, VoidCallback onReloadTry) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(DimensionsConstants.mediumSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage,
                  style: TextStyle(
                      fontSize: FontConstants.smallMediumFont,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: DimensionsConstants.smallMediumSpacing),
                FlatButton(
                    color: Colors.purple,
                    onPressed: onReloadTry,
                    child: Text("Reload", style: TextStyle(fontSize: FontConstants.smallFont, color: Colors.white))
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}