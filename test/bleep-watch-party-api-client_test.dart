import 'package:bleep_flutter/watchparty/repository/apiclient/watch-party-api-client.dart';
import 'package:bleep_flutter/watchparty/repository/entity/watch-party-entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';

void main() {

  BleepWatchPartyApiClient _sut = BleepWatchPartyApiClient("");

  test("test_When_FetchWatchPartiesRequestIsSuccessful_Expect_ListOfWatchPartiesReturned", () async {
    //Arrange
    int successCode = 200;
    final String watchPartyName = "System testing watch party";
    final String watchPartyDescription = "Testing to see if I can create a watch party from Postman with updated variables!";

    final String watchPartyId = "-MLRe3OxtxLVeocDcqGf";
    _sut.httpClient = MockClient((request) async {
      final fetchWatchPartyPayload = [{
          "selectedPlaylist":{
            "playlistId": "playlistId",
            "playlistName": "Awesome playlist name"
          },
          "watchPartyBio":{
            "name": watchPartyName,
            "description": watchPartyDescription
          },
          "status":{
            "started":"2020-11-06T08:24:35.000Z",
            "ended":""
          },
          "allParticipants":{
            "queueSummary":{
              "visibilityScope":"private",
              "windowParticipants":{
                "count":0,
                "participants":[]
              },
              "couchParticipants":{
                "count":0,
                "participants":[]
              },
              "hostParticipant":{
                "userId":"3Jw3xDBGROhN1NXFfAwLK3rN8Bp1",
                "avatarThumbnailUrl":""
              }
            }
          },
          "watchPartyId": watchPartyId
      }];

      return Response(json.encode(fetchWatchPartyPayload), successCode);
    });

    // Act
    List<WatchPartyEntity> fetchWatchPartyResponse = await _sut.fetchWatchParties();
    //Assert
    expect(fetchWatchPartyResponse.elementAt(0).watchPartyId, watchPartyId);
    expect(fetchWatchPartyResponse.elementAt(0).watchPartyBio.name, watchPartyName);
    expect(fetchWatchPartyResponse.elementAt(0).watchPartyBio.description, watchPartyDescription);
  });

  test('test_When_ThereIsAnErrorWhileFetchingWatchParties_Expect_TheAPIClientThrowsAnError', () async {

    //Arrange
    int errorCode = 500;
    final String errorMessage = "Unable to fetch watch parties";
    _sut.httpClient = MockClient((request) async {
      return Response("Error fetching watch parties", errorCode);
    });

    //Act+//Assert
    expect(() async => await _sut.fetchWatchParties(), throwsA(isInstanceOf<Exception>()));
  });
}