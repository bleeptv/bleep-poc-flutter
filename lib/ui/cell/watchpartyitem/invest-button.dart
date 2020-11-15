import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvestButton extends StatefulWidget {
  InvestButton({Key key, this.isTaken}): super(key: key);
  final bool isTaken;

  @override
  _InvestButtonState createState () => _InvestButtonState();
}

class _InvestButtonState extends State<InvestButton> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: DimensionsConstants.actionButtonWidth,
      margin: EdgeInsets.only(left: DimensionsConstants.smallSpacing, top: DimensionsConstants.smallMediumSpacing),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionsConstants.mediumLargeSpacing),
            side: BorderSide(color: Colors.black, width: 2)
        ),
        child: MaterialButton(
            onPressed: (){},
            height: DimensionsConstants.actionButtonHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Take", style: TextStyle(color: Colors.black, fontSize: FontConstants.smallMediumFont, fontWeight: FontWeight.w500)),
                SizedBox(width: DimensionsConstants.smallSpacing),
                new Image.asset(
                  "assets/images/icons/bleep_currency.png",
                  height: DimensionsConstants.smallMediumIcon,
                  width: DimensionsConstants.smallMediumIcon,
                ),
              ],
            )
        ),
      ),
    );
  }
}