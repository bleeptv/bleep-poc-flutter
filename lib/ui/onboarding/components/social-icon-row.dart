import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:flutter/widgets.dart';

///
/// Widget to show facebook, twitter, and youtube icons in a row on the sign up page
class SocialIconsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
            "assets/images/icons/instagram.png",
            height: DimensionsConstants.signUpScreenIconSize,
            width: DimensionsConstants.signUpScreenIconSize
        ),
        SizedBox(width: DimensionsConstants.mediumSpacing),
        Image.asset(
            "assets/images/icons/youtube.png",
            height: DimensionsConstants.signUpScreenIconSize,
            width: DimensionsConstants.signUpScreenIconSize
        ),
        SizedBox(width: DimensionsConstants.mediumSpacing),
        Image.asset(
            "assets/images/icons/twitter.png",
            height: DimensionsConstants.signUpScreenIconSize,
            width: DimensionsConstants.signUpScreenIconSize
        ),
      ],
    );
  }
}