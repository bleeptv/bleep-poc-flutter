import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WatchPartyTitleDetails extends StatelessWidget {

  final String description;

  WatchPartyTitleDetails({@required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(DimensionsConstants.smallSpacing),
      child: Wrap(
        children: [
          Text("EP.101", style: TextStyle(fontSize: FontConstants.smallMediumFont, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: DimensionsConstants.mediumSpacing),
          Text(
              this.description,
              style: TextStyle(fontSize: FontConstants.smallFont, fontWeight: FontWeight.w400, color: Colors.white)
          ),
        ],
      ),
    );
  }
}