import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shop/model/user_model.dart';
import 'package:my_shop/service/firestore_user.dart';
import 'package:my_shop/view/home_page.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;

  RxDouble _obacity = 1.0.obs;
  RxDouble get obacity => _obacity;

  void tapDownOpacity() {
    _obacity.value = .4;
  }

  void cancelTapOpacity() {
    _obacity.value = 1.0;
  }

  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    // any thing that changes in authStateChanges is notified in user and update the value
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
    final _userCredentials = await _auth.signInWithCredential(_credentials);
    await saveUser(_userCredentials);
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
      final _userCredentials =
          await _auth.signInWithCredential(_facebookCredentials);
      await saveUser(_userCredentials);
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

  void createAccountWithEmailAndPassword() async {
    try {
      Get.snackbar(
        'Trying To Create An Account',
        'Please Wait',
        snackPosition: SnackPosition.BOTTOM,
      );
      final _userCredentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await saveUser(_userCredentials);

      Get.offAll(() => HomePage());
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar(
        'Error when trying to create an account',
        e.message,
        colorText: Colors.black,
        backgroundColor: Colors.grey[400],
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> saveUser(UserCredential userCredential) {
    UserModel userModel = UserModel(
      userId: userCredential.user.uid,
      name: name == null ? userCredential.user.displayName : name,
      emailAdress: userCredential.user.email,
    );
    return FirestoreUser().addUserToFirestore(userModel);
  }
}
