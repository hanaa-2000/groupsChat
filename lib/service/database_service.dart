
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBasService{

  final String userId;

  DataBasService({required this.userId});

  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  CollectionReference groupCollection = FirebaseFirestore.instance.collection('groups');


  Future updateUserData(String fullName ,String email)async{

    return await userCollection.doc(userId).set(
      {
        'fullName':fullName,
        'email':email,
        'profilePic':'',
        'groups':[],
        'uId':userId,
      });
  }


}