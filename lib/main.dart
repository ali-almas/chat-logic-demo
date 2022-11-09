import 'package:chat_logic/chat_input_controller.dart';
import 'package:chat_logic/chat_page.dart';
import 'package:chat_logic/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider<ChatViewModel>(
        create: (BuildContext context) => ChatViewModel(
          inputController: ChatInputController(),
        ),
        child: const ChatPage(),
      ),
    );
  }
}
