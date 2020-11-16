import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeNavigationBar extends StatefulWidget {
  _HomeNavigationBarState createState () => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            "assets/images/icons/home_icon.png",
            height: DimensionsConstants.smallIcon,
            width: DimensionsConstants.smallIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            "assets/images/icons/search_icon.png",
            height: DimensionsConstants.smallIcon,
            width: DimensionsConstants.smallIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            "assets/images/icons/maps_icon.png",
            height: DimensionsConstants.smallIcon,
            width: DimensionsConstants.smallIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Image.asset(
            "assets/images/icons/bell_icon.png",
            height: DimensionsConstants.smallIcon,
            width: DimensionsConstants.smallIcon,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: this.buildProfileButton(0.2),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (nexIndex) => setState(() =>  _currentIndex = nexIndex),
    );
  }

  Widget buildProfileButton(double percentProgress) {
    return  CircularPercentIndicator(
      radius: DimensionsConstants.mediumLargeSpacing,
      lineWidth: 3.0,
      startAngle: 220,
      progressColor: Colors.blue,
      percent: 0.775 * percentProgress,
      animation: true,
      backgroundColor: Colors.transparent,
      center: Image.asset(
        "assets/images/background/user_avatar.png",
        height: DimensionsConstants.smallMediumIcon,
        width: DimensionsConstants.smallMediumIcon,
      ),
    );
  }
}