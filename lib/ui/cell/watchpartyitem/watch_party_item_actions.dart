import 'package:bleep_flutter/ui/asset-constants.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WatchPartyItemActions extends StatefulWidget {
  _WatchPartyItemActionsState createState () => _WatchPartyItemActionsState();
}

class _WatchPartyItemActionsState extends State<WatchPartyItemActions> {

  bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: DimensionsConstants.smallMediumSpacing,
          right: DimensionsConstants.smallSpacing),
      child: Row(
        children: [
          IconButton(
            onPressed: (){},
            icon: Image.asset(
                '${AssetConstants.ICONS}/bookmark_outlined.png'
            ),
            padding: EdgeInsets.all(DimensionsConstants.smallSpacing),
            iconSize: DimensionsConstants.mediumIcon,
            splashRadius: DimensionsConstants.smallMediumIcon,
          ),
          IconButton(
              onPressed: (){},
              icon: Image.asset(
                  '${AssetConstants.ICONS}/send_outlined.png'
              ),
              iconSize: DimensionsConstants.mediumIcon,
              splashRadius: DimensionsConstants.smallMediumIcon
          ),
        ],
      ),
    );
  }
}