import 'dart:ui';

import 'package:bleep_flutter/ui/cell/watchpartyitem/album-cover.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/credit-score-rating.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/invest-button.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:flutter/material.dart';

class WatchPartyCell extends StatelessWidget {

  final WatchParty item;

  WatchPartyCell({@required this.item});

  @override
  Widget build(BuildContext context) {

    return Material(
        child: Padding(
          padding: EdgeInsets.only(top: DimensionsConstants.mediumLargeSpacing),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: DimensionsConstants.smallSpacing,
                        top: DimensionsConstants.extraSmallSpacing,
                        right: DimensionsConstants.smallSpacing
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("WATCH PARTY", style: TextStyle(fontSize: FontConstants.extraSmallFont, color: Colors.purple, fontWeight: FontWeight.w700)),
                        SizedBox(height: DimensionsConstants.extraSmallSpacing),
                        Row(
                          children: [
                            Text("Bee Diamondhead", style: TextStyle(fontSize: FontConstants.smallMediumFont, color: Colors.black)),
                            SizedBox(width: DimensionsConstants.extraSmallSpacing),
                            CreditRatingIcon(creditLevel: "3"),
                          ],
                        ),
                      ],
                    )
                ),
                AlbumCover(item: this.item),
                Row(
                  children: [
                    InvestButton()
                  ],
                )
              ],
            ),
          ),
        )
    );
    throw UnimplementedError();
  }
}