import 'package:flutter/material.dart';

import '../widgets/new_message.dart';
import '../Models/message.dart';
import '../widgets/message_bubble.dart';
import '../Proxy/open_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<void> _addMessage(messageText) async {
    setState(() {
      _messages.insert(0, Message(text: messageText, isUser: true));
      _messages.insert(0, Message(text: '...'));
    });

    final message = await OpenAi.getResponse(messageText);

    setState(() {
      _messages.removeAt(0);
      _messages.insert(0, Message(text: message));
    });
  }

  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'ENNACHAT BOT',
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
