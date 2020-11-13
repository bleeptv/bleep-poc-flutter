import 'dart:convert';

import 'package:bleep_flutter/watchparty/repository/entity/watch-party-entity.dart';
import 'package:http/http.dart';

///
class WatchPartyApiClient {
  ///Fetch playlists from the server-side
  Future<List<WatchPartyEntity>> fetchWatchParties() {}
}

///
/// Actual Implementation of the watch party API client
class BleepWatchPartyApiClient implements WatchPartyApiClient {
  Client httpClient = Client();
  final String _baseUrl;

  BleepWatchPartyApiClient(this._baseUrl);

  final String _FETCH_WATCH_PARTY_ERROR = "Unable to fetch watch parties";

  final String _FETCH_ALL_ENDPOINT = "api/v1/watch-parties";
  final int STATUS_CODE_OK = 200;

  @override
  Future<List<WatchPartyEntity>> fetchWatchParties() async {
    final fetchWatchPartiesResponse = await httpClient.get("$_baseUrl$_FETCH_ALL_ENDPOINT");
    if(fetchWatchPartiesResponse.statusCode != STATUS_CODE_OK) throw Exception(_FETCH_WATCH_PARTY_ERROR);

    final responseCollection = jsonDecode(fetchWatchPartiesResponse.body) as List<dynamic>;
    return responseCollection.map((jsonMap) => WatchPartyEntity.fromJson(jsonMap)).toList();
  }
}