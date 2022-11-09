import 'dart:async';

import 'package:chat_logic/chat_input_controller.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatInputController inputController;

  ChatViewModel({required this.inputController}) {
    listenInputMessages();
  }

  final List<IMessage> _messages = [
    Message(
      id: UniqueKey(),
      text: "Hi, how are you?",
    ),
    Message(
      id: UniqueKey(),
      opponentType: OpponentType.receiver,
      text: "I'm fine, thanks!",
    ),
    Message(
      id: UniqueKey(),
      opponentType: OpponentType.receiver,
      text: "What about you?",
    ),
    Message(
      id: UniqueKey(),
      text: "I'm fine too!",
      replyTo: Message(
        id: UniqueKey(),
        opponentType: OpponentType.receiver,
        text: "I'm fine, thanks!",
      ),
    ),
  ];

  IMessage? _pendingReplyToMessage;
  StreamSubscription<IMessage>? _inputMessageSubscription;

  List<IMessage> get messages => _messages;

  listenInputMessages() {
    _inputMessageSubscription = inputController.inputMessageStream.listen((message) {
      final newMessage = message.copyWith(replyTo: _pendingReplyToMessage);
      sendMessage(newMessage);
    });
  }

  sendMessage(IMessage message) {
    _pendingReplyToMessage = null;
    _messages.add(message);
    notifyListeners();
  }

  replyTo(IMessage message) {
    _pendingReplyToMessage = message;
    notifyListeners();
  }

  @override
  void dispose() {
    inputController.close();
    _inputMessageSubscription?.cancel();
    super.dispose();
  }
}
