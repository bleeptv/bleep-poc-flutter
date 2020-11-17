import 'file:///C:/Users/asus/bleep/flutter/bleep_flutter/lib/bloc/homefeed/events/fetch-watch-parties-event.dart';
import 'package:bleep_flutter/bloc/homefeed/home-feed-bloc.dart';
import 'package:bleep_flutter/bloc/homefeed/state/HomeFeedState.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:bleep_flutter/watchparty/repository/apiclient/watch-party-api-client.dart';
import 'package:bleep_flutter/watchparty/repository/entity/watch-party-entity.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWatchPartyApiClient extends Mock implements WatchPartyApiClient {}

void main() {

  MockWatchPartyApiClient _mockWatchPartyApiClient;

  setUp(() {
    _mockWatchPartyApiClient = MockWatchPartyApiClient();
  });

  group("Fetch Watch Parties", () {
    String watchPartyId = "watchPartyId";
    String watchPartyName = "watch party name";
    String watchPartyDescription = "watch party description";
    String playlistId = "PlaylistId";
    String playlistName = "Playlist name";

    WatchPartyEntity watchPartyEntity = WatchPartyEntity(
      watchPartyId: watchPartyId,
      watchPartyBio: WatchPartyBio(
        name: watchPartyName,
        description: watchPartyDescription
      ),
      selectedPlaylist: SelectedWatchPartyPlaylist(
        playlistId: playlistId,
        playlistName: playlistName
      )
    );

    WatchParty expectedWatchParty = WatchParty(
      watchPartyId,
      "",
      "",
      watchPartyName,
      watchPartyDescription,
      0,
      0
    );

    blocTest("test_When_HomeFeedOpens_Expect_HomeFeedBlocTriggersFetchWatchParties",
      build: () {
        when(_mockWatchPartyApiClient.fetchWatchParties())
            .thenAnswer((_) async => [watchPartyEntity]);
        return HomeFeedBloc(_mockWatchPartyApiClient);
      },
      act: (bloc) => bloc.add(FetchWatchPartiesEvent()),
      expect: [
        HomeFeedShowLoading(),
        HomeFeedHideLoading(),
        HomeFeedLoaded([expectedWatchParty])
      ]
    );

    blocTest("test_When_ErrorOccursWhenFetchingWatchParties_Expect_HomeFeedBlocShowsAnError",
        build: () {
          when(_mockWatchPartyApiClient.fetchWatchParties())
              .thenAnswer((_) async => throw Exception());
          return HomeFeedBloc(_mockWatchPartyApiClient);
        },
        act: (bloc) => bloc.add(FetchWatchPartiesEvent()),
        expect: [
          HomeFeedShowLoading(),
          HomeFeedHideLoading(),
          HomeFeedShowError("")
        ]
    );
  });
}