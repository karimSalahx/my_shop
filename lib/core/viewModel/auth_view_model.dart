import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;

  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    // Listen on any change in authentication state whether he is logged in or not
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignIn() async {
    // Sign in
    final GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    print(_googleUser);
    // Get sign in auth token contains accessToken , idToken
    final GoogleSignInAuthentication _googleAuth =
        await _googleUser.authentication;
    // get credentials with access token
    final OAuthCredential _credentials = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );
    await _auth.signInWithCredential(_credentials);
  }

  void facebookSignIn() async {
    // sign in with goole
    final FacebookLoginResult _result = await _facebookLogin.logIn(['email']);
    // get access token
    final String _accessToken = _result.accessToken.token;
    if (_result.status == FacebookLoginStatus.loggedIn) {
      // get credentials with accessToken
      final OAuthCredential _facebookCredentials =
          FacebookAuthProvider.credential(_accessToken);
      await _auth.signInWithCredential(_facebookCredentials);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      Get.snackbar(
        'Trying To login',
        'Please Wait',
        snackPosition: SnackPosition.BOTTOM,
      );
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar(
        'Error when trying to log in to account',
        e.message,
        colorText: Colors.black,
        backgroundColor: Colors.grey[400],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
