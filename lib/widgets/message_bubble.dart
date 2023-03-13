import 'package:flutter/material.dart';

import 'package:en_chatbot/Models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .8,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: message.isUser ? Colors.black12 : Colors.black87,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(message.isUser ? 10 : 0),
                topRight: Radius.circular(message.isUser ? 0 : 10),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.black87 : Colors.white,
                fontSize: 15
              ),
            ),
          ),
        ],
      ),
    );
  }
}
