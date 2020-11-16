import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/font-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Widget for buttons to sign-in on the sign up page. Currently used for
/// Google and Facebook sign in
class SignInButton extends StatelessWidget {

  final String iconName;
  final String signInOptionText;
  final VoidCallback onPress;

  SignInButton({
    this.iconName,
    this.signInOptionText,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(
          left: DimensionsConstants.smallMediumSpacing,
          right: DimensionsConstants.smallMediumSpacing,
          top: DimensionsConstants.extraSmallSpacing
      ),
      child: Material(
        shape: StadiumBorder(),
        child: MaterialButton(
            onPressed: this.onPress,
            height: DimensionsConstants.actionButtonHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Image.asset(
                  this.iconName,
                  height: DimensionsConstants.smallIcon,
                  width: DimensionsConstants.smallIcon,
                ),
                SizedBox(width: DimensionsConstants.smallMediumSpacing),
                Text(this.signInOptionText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: FontConstants.actionButtonFont,
                      fontWeight: FontWeight.w500
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}