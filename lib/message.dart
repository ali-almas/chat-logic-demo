import 'package:flutter/material.dart';

enum OpponentType { sender, receiver }

enum MessageType { text, image, video, audio, file }

abstract class IMessage {
  UniqueKey get id;
  OpponentType get opponentType;
  MessageType get messageType;
  String? text;
  String? url;
  IMessage? replyTo;
  GlobalKey? get key;

  IMessage copyWith({
    UniqueKey? id,
    OpponentType? opponentType,
    MessageType? messageType,
    String? text,
    String? url,
    IMessage? replyTo,
  });
}

class Message implements IMessage {
  Message({
    required this.id,
    this.opponentType = OpponentType.sender,
    this.messageType = MessageType.text,
    this.text,
    this.url,
    this.replyTo,
  });

  @override
  final UniqueKey id;

  @override
  final OpponentType opponentType;

  @override
  final MessageType messageType;

  @override
  String? text;

  @override
  String? url;

  @override
  IMessage? replyTo;

  @override
  GlobalKey? get key => GlobalKey();

  @override
  copyWith({
    UniqueKey? id,
    OpponentType? opponentType,
    MessageType? messageType,
    String? text,
    String? url,
    IMessage? replyTo,
  }) {
    return Message(
      id: id ?? this.id,
      opponentType: opponentType ?? this.opponentType,
      messageType: messageType ?? this.messageType,
      text: text ?? this.text,
      url: url ?? this.url,
      replyTo: replyTo ?? this.replyTo,
    );
  }
}
