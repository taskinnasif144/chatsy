import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String message;
  final String senderID;
  final String receiverID;
  final Timestamp? timestamp;

  ChatModel(
      {required this.message,
      required this.senderID,
      required this.receiverID,
      this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "senderID": senderID,
      "receiverID": receiverID,
      "timeStamp": Timestamp.now(),
    };
  }

  ChatModel fromJson(parsedJSON) {
    return ChatModel(
        message: parsedJSON['message'],
        senderID: parsedJSON['senderID'],
        receiverID: parsedJSON['receiverID'],
        timestamp: parsedJSON['timeStamp']);
  }
}
