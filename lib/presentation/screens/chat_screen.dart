import 'package:chat_gpt_applicaton/presentation/constants/constants.dart';
import 'package:chat_gpt_applicaton/presentation/services/asset_manager.dart';
import 'package:chat_gpt_applicaton/presentation/services/services.dart';
import 'package:chat_gpt_applicaton/presentation/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await Services.showModalSheet(context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ),
            )
          ],
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage(AssetManager.logoImage)),
          ),
          backgroundColor: cardColor,
          title: const Text(
            "ChatGPT",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    String chatMessage = chatMessages[index]["msg"].toString();
                    int chatIndex =
                        int.parse(chatMessages[index]["chatIndex"].toString());

                    return ChatWidget(
                      message: chatMessage,
                      chatIndex: chatIndex,
                    );
                  },
                ),
              ),
              if (_isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
              ],
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _controller,
                          onSubmitted: (value) {},
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can I help you",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
