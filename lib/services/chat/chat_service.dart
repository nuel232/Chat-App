import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get user stream
  /* 

  List List<Map<String,dynamic> = 

  [
  {
    'email': test@gmail.com,
    'id': ..
  },
  {
    'email': test@gmail.com,
    'id': ..
  },
  {
    'email': test@gmail.com,
    'id': ..
  },
  ]

  SO IN SHORT A LIST OF MAP THAT


  */

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    //return firestore collection
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  // send message

  //get messages
}
