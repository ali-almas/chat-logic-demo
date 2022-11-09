import 'package:flutter/material.dart';

import 'message.dart';

class ChatMessage extends StatelessWidget {
  final IMessage message;

  const ChatMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.opponentType == OpponentType.sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (message.replyTo != null)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(message.replyTo!.text!),
          ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: message.opponentType == OpponentType.sender ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message.text!,
            style: TextStyle(
              color: message.opponentType == OpponentType.sender ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
