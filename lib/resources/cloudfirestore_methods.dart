import 'package:amazon_flutter/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firestoreFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firestoreFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }
}
