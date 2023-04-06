import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSIgnInHelper {
  static Future<UserCredential> googleSignInMethod(GoogleSignIn googleSignIn, FirebaseAuth auth) async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    return auth.signInWithCredential(credential);
  }

  static Future<void> googleSignOutMethod() async {
    await GoogleSignIn(scopes: ['email']).signOut();
  }
}
