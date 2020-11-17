import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

///
/// Account provider to help with logging in with Google
class BleepAccountManager {

  final String _GOOGLE_LOGIN_ERROR = "Error logging in with Google";

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        "email",
        "https://www.googleapis.com/auth/youtube.readonly"
      ]
  );

  ///
  /// Login with Google, providing a [onSuccess] callback for a successful login and
  /// a [onError] callback containing an error message in the case of an error
  Future<void> loginWithGoogle({Function onSuccess, Function(String errorMessage) onError}) async {
    try {
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      this._sigInWithFirebase(
        googleSignInAuthentication.accessToken,
        googleSignInAuthentication.idToken,
        onSuccess: onSuccess,
        onError: onError
      );
    } catch (error) {
      onError(error.toString());
    }
  }

  ///
  /// Sign in into a firebase user authentication instance
  /// Provider a google signIn [accessToken] and [idToken], along with
  /// the [onSuccess] and [onError] callbacks to check the status of the
  /// sign in process
  Future<void> _sigInWithFirebase(
      String accessToken,
      String idToken,
      {Function onSuccess, Function(String errorMessage) onError}) async
  {

    try {
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: accessToken,
        idToken: idToken,
      );

      await _auth.signInWithCredential(credential);
      onSuccess();
    } catch (error) {
      onError(error.toString());
    }
    onError(_GOOGLE_LOGIN_ERROR);
  }
}