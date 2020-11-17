

import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationSlider extends StatefulWidget {
  _DestinationSliderState createState () => _DestinationSliderState();
}

class _DestinationSliderState extends State<DestinationSlider> {
  double _value = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: DimensionsConstants.mediumSpacing
      ),
      child: Column(
        children: [
          this.buildWalletBalance(35.51),
          Container(
            height: DimensionsConstants.smallMediumSpacing,
            margin: EdgeInsets.only(
                left: DimensionsConstants.smallMediumSpacing,
                right: DimensionsConstants.smallMediumSpacing
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Basic"),
                Text("VVIP")
              ],
            ),
          ),
          SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1.0,
              ),
              child: Slider(
                min: 0,
                max: 100,
                activeColor: Colors.black,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              )
          )
        ],
      ),
    );
  }

  Widget buildWalletBalance(double walletAmount) {
    return Padding(
      padding: EdgeInsets.only(top: DimensionsConstants.smallSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Wallet", style: TextStyle(fontSize: FontConstants.smallMediumFont)),
          SizedBox(width: DimensionsConstants.extraSmallSpacing),
          Image.asset("assets/images/icons/bleep_currency_small.png",
            width: DimensionsConstants.smallIcon,
            height: DimensionsConstants.smallIcon,
          ),
          SizedBox(width: DimensionsConstants.extraSmallSpacing),
          Text("$walletAmount", style: TextStyle(fontSize: FontConstants.smallMediumFont, fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}