import 'package:flutter/material.dart';

import '../widgets/new_message.dart';
import '../Models/message.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _addMessage(messageText) {
    setState(() {
      _messages.insert(0, Message(text: messageText, isUser: true));
    });
  }

  final List<Message> _messages = [
    Message(text: 'hello'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'EN BOT',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => MessageBubble(
              message: _messages[index],
            ),
            itemCount: _messages.length,
          ),
        ),
        NewMessage(
          addMessage: _addMessage,
        )
      ]),
    );
  }
}
