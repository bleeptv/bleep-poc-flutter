import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/widgets.dart';

class AlbumForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.only(left: DimensionsConstants.extraLargeSpacing),
          child: Image.asset(
            "assets/images/background/maze_album_cover_1.png",
            width: DimensionsConstants.albumCoverImageWidth,
            height: DimensionsConstants.albumCoverHeight,
            alignment: Alignment.bottomRight,
          )
      ),
    );
  }
}