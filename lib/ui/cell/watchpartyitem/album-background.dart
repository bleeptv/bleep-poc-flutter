import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AlbumBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.white,
        width: double.infinity,
        height: DimensionsConstants.albumCoverHeight,
        padding: EdgeInsets.only(top: DimensionsConstants.mediumLargeSpacing),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.green, Colors.blue],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp
                )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(DimensionsConstants.smallSpacing),
                    child: Text("6:01", style: TextStyle(fontSize: FontConstants.smallFont, color: Colors.white))
                )
              ],
            )
        )
    );
  }
}