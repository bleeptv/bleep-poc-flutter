import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-playlist-preview.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-title-details.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WatchPartyCellDetails extends StatelessWidget {

  final String watchPartyTitle;
  final String description;

  WatchPartyCellDetails(
      {
        @required this.watchPartyTitle,
        @required this.description
      }
    );

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        height: DimensionsConstants.albumCoverHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: DimensionsConstants.largeSpacing,
                  left: DimensionsConstants.smallSpacing
              ),
              child: Text(
                this.watchPartyTitle,
                style: TextStyle(
                    fontSize: FontConstants.extraLargeFont,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontFamily: FontConstants.MONTSERRAT_ALTERNATES
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: DimensionsConstants.largeSpacing),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                WatchPartyTitleDetails(description: description),
                WatchPartyPlaylistPreview()
              ],
            )
          ],
        )
    );
  }
}