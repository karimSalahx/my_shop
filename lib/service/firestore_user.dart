import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFirestore(UserModel userModel) async {
    await _userReference.doc(userModel.userId).set(userModel.toJson());
  }
}
