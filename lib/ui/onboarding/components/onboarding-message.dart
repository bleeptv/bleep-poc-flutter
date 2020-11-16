import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/textstyle/onboarding-text-style.dart';
import 'package:flutter/widgets.dart';

///
/// Widget to display text on the onboarding screens
class OnboardingMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Get paid", style: OnBoardingTextStyle.MESSAGE),
        Row(
          children: [
            Text("for ", style: OnBoardingTextStyle.MESSAGE),
            Image.asset("assets/images/icons/heart_comment.png",
                height: DimensionsConstants.extraLargeIcon,
                width: DimensionsConstants.extraLargeIcon
            ),
            Text("ing dope ", style: OnBoardingTextStyle.MESSAGE),
          ],
        ),
        Text("creators", style: OnBoardingTextStyle.MESSAGE),
      ],
    );
  }
}