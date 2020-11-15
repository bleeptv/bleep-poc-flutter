import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/widgets.dart';

class WatchPartyPlaylistImage extends StatelessWidget {

  final double _imageIconSize = 24;
  final double thumbnailWidth;
  final double thumbnailHeight;
  final String thumbnailImage;
  final String iconImage;

  WatchPartyPlaylistImage({
    this.thumbnailImage,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.iconImage
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          Image.asset(
            this.thumbnailImage,
            width: this.thumbnailWidth,
            height: this.thumbnailHeight,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(DimensionsConstants.extraSmallSpacing),
            child: Image.asset(
              this.iconImage,
              width: this._imageIconSize,
            ),
          )
        ],
      ),
    );
  }
}