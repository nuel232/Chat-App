import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderEmail,
    required this.senderID,
    required this.receiverID,
    required this.timestamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'SenderID': senderID,
      'senderEmail': senderEmail,
      'message': message,
      'receiverID': receiverID,
      'timestamp': timestamp,
    };
  }
}
