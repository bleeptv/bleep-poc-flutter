

import 'package:bleep_flutter/services/bleep-account-manager.dart';
import 'package:bleep_flutter/ui/dimension-constants.dart';
import 'package:bleep_flutter/ui/homefeed/home-feed-page.dart';
import 'package:bleep_flutter/ui/onboarding/components/onboarding-message.dart';
import 'package:bleep_flutter/ui/onboarding/components/signin-button.dart';
import 'package:bleep_flutter/ui/onboarding/components/social-icon-row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatelessWidget {

  final BleepAccountManager accountManager = BleepAccountManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Material(
              color: Colors.black,
              child:  Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                          image: AssetImage("assets/images/background/signup_background.png"),
                          fit: BoxFit.cover
                      )
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: DimensionsConstants.smallSpacing,
                          bottom: DimensionsConstants.smallMediumSpacing,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OnboardingMessage(),
                            SizedBox(height: DimensionsConstants.smallMediumSpacing),
                            SocialIconsRow()
                          ],
                        ),
                      ),
                      SignInButton(
                        iconName: "assets/images/icons/google.png",
                        signInOptionText: "Continue with Google",
                        onPress: (){
                          this.accountManager.loginWithGoogle(
                              onSuccess: () => _onLoginSuccess(context),
                              onError: (errorMessage) => _onErrorGoogleLogin(context, errorMessage)
                          );
                        },
                      ),
                      SignInButton(
                        iconName: "assets/images/icons/facebook.png",
                        signInOptionText: "Continue with Facebook",
                        onPress: (){
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Sign-in With Facebook"),
                          ));
                        },
                      ),
                      SizedBox(height: DimensionsConstants.mediumLargeSpacing)
                    ],
                  ),
                ),
            );
        },
      ),
    );
  }

  void _onLoginSuccess(BuildContext context) {

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomeFeedScreen()
        ),
        ModalRoute.withName("")
    );
  }

  void _onErrorGoogleLogin(BuildContext context, String errorMessage) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
    ));
  }

}