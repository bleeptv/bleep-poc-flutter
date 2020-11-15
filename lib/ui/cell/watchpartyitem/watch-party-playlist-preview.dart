import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-playlist-image.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/widgets.dart';

class WatchPartyPlaylistPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(DimensionsConstants.extraSmallSpacing),
      child: Container(
        child: Row(
          children: [
            WatchPartyPlaylistImage(
              thumbnailImage: "assets/images/background/playlist_img_regular.png",
              thumbnailWidth: DimensionsConstants.primaryPlaylistItemWidth,
              thumbnailHeight: DimensionsConstants.playlistPreviewHeight,
              iconImage: "assets/images/icons/instagram.png",
            ),
            WatchPartyPlaylistImage(
              thumbnailImage: "assets/images/background/playlist_img_small.png",
              thumbnailWidth: DimensionsConstants.secondaryPlaylistItemWidth,
              thumbnailHeight: DimensionsConstants.playlistPreviewHeight,
              iconImage: "assets/images/icons/youtube.png",
            )
          ],
        ),
      ),
    );
  }
}