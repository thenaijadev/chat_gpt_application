import 'package:chat_gpt_applicaton/presentation/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'presentation/constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          primaryColor: scaffoldBackgroundColor,
          useMaterial3: true,
          appBarTheme: AppBarTheme(backgroundColor: scaffoldBackgroundColor)),
      home: const ChatScreen(),
    );
  }
}
