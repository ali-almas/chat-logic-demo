import 'package:chat_logic/chat_input.dart';
import 'package:chat_logic/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: viewModel.messages.length,
                itemBuilder: (_, index) {
                  final message = viewModel.messages[viewModel.messages.length - index - 1];
                  return Dismissible(
                    key: message.id,
                    confirmDismiss: (_) {
                      viewModel.replyTo(message);
                      return Future.value(false);
                    },
                    child: ChatMessage(message: message),
                  );
                },
              ),
            ),
            ChatInput(controller: viewModel.inputController),
          ],
        ),
      ),
    );
  }
}
