import 'package:chat_logic/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPendingMessage extends StatelessWidget {
  const ChatPendingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChatViewModel>();

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: viewModel.pendingReplyToMessage != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                viewModel.pendingReplyToMessage?.text ?? 'no content',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
