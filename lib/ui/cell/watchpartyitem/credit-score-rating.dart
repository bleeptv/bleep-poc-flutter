import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreditRatingIcon extends StatelessWidget {
  final String creditLevel;

  CreditRatingIcon({this.creditLevel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionsConstants.smallMediumSpacing,
      width: DimensionsConstants.smallMediumSpacing,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background/credit_rating_polygon.png")
          )
      ),
      child: Center(
          child: Text(this.creditLevel, style: TextStyle(color: Colors.purple))
      ),
    );
  }
}