import 'package:bleep_flutter/ui/asset-constants.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/widgets.dart';

class WatchPartyQueue extends StatelessWidget {

  String queueAction = "Taken by";
  String firstUserHandle = "Eva Sithole";
  int queueRemainderSize = 83;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DimensionsConstants.smallSpacing),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: DimensionsConstants.smallSpacing * 2),
                child: this._constructAvatar('${AssetConstants.BACKGROUNDS}/small_avatar_3.png'),
              ),
              Padding(
                  padding: EdgeInsets.only(left: DimensionsConstants.smallSpacing),
                  child: this._constructAvatar('${AssetConstants.BACKGROUNDS}/small_avatar_2.png')
              ),
              this._constructAvatar('${AssetConstants.BACKGROUNDS}/small_avatar_1.png'),
            ],
          ),
          SizedBox(width: DimensionsConstants.smallSpacing),
          Text("$queueAction "),
          Text("$firstUserHandle ", style: TextStyle(fontWeight: FontWeight.w500)),
          Text("and "),
          Text("$queueRemainderSize fans", style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _constructAvatar(String avatarUri) {
    return Image.asset(avatarUri,
        width: DimensionsConstants.smallIcon,
        height: DimensionsConstants.smallIcon
    );
  }
}