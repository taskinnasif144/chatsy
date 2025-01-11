import 'package:chatsy/models/chat_model.dart';
import 'package:chatsy/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final fireStore = FirebaseFirestore.instance;
  final Auth _auth = Auth();

  Future sendMessage(id1, message) async {
    String id2 = _auth.authUser.uid;
    final ids = [id1, id2];
    ids.sort();
    final roomID = ids.join("-");
    final newChatModel =
        ChatModel(message: message, senderID: id2, receiverID: id1);
    fireStore
        .collection("chats")
        .doc(roomID)
        .collection("messages")
        .doc()
        .set(newChatModel.toJson());
  }

  Stream<List<ChatModel>> getMessage(id1) {
    String id2 = _auth.authUser.uid;
    final ids = [id1, id2];
    ids.sort();
    final roomID = ids.join("-");
    final snapshots = fireStore
        .collection("chats")
        .doc(roomID)
        .collection("messages").orderBy("timeStamp")
        .snapshots()
        .map((snap) => snap.docs
        .map((doc) => ChatModel(
      message: doc["message"],
      senderID: doc["receiverID"],
      receiverID: doc["senderID"],
      timestamp: doc["timeStamp"],
    ))
        .toList());
    return snapshots;
  }
}
