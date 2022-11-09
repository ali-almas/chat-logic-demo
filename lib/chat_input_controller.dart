import 'package:chat_logic/message.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ChatInputController {
  final _textEditingController = TextEditingController();
  final _inputMessageController = BehaviorSubject<IMessage>();

  TextEditingController get textEditingController => _textEditingController;
  Stream<IMessage> get inputMessageStream => _inputMessageController.stream;

  void sendMessage() {
    final text = _textEditingController.text;

    if (text.isNotEmpty) {
      _inputMessageController.add(
        Message(
          id: UniqueKey(),
          text: text,
        ),
      );
      _textEditingController.clear();
    }
  }

  close() {
    textEditingController.clear();
    textEditingController.dispose();
  }
}
