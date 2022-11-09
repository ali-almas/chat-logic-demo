import 'package:chat_logic/chat_input_controller.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final ChatInputController? controller;

  const ChatInput({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller?.textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter a message',
              ),
            ),
          ),
          IconButton(
            onPressed: controller?.sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
