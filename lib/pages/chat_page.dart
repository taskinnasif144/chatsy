import 'package:chatsy/components/chat_bubble.dart';
import 'package:chatsy/components/my_text_field.dart';
import 'package:chatsy/models/chat_model.dart';
import 'package:chatsy/services/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.uid, required this.email});
  final String uid;
  final String email;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chatController.dispose();
  }

  final ChatService _chatService = ChatService();
  void sendMessage() {
    _chatService.sendMessage(widget.uid, _chatController.text);
    _chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Center(child: Text(widget.email)),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: _chatService.getMessage(widget.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final chat = snapshot.data![index];
                              return ChatBubble(message: chat.message, isMyText: widget.uid == chat.receiverID,);
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Flexible(
                          child: MyTextField(
                              textController: _chatController,
                              hintText: "Your Message",
                              isPass: false)),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: sendMessage,
                          icon: Icon(
                            Icons.send,
                            size: 32,
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}

