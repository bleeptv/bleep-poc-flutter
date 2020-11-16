

import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationSlider extends StatefulWidget {
  _DestinationSliderState createState () => _DestinationSliderState();
}

class _DestinationSliderState extends State<DestinationSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: DimensionsConstants.mediumSpacing
      ),
      width: double.infinity,
      child: Column(
        children: [
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
}