import 'package:firexample/chat/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRommState createState() => _ChatRommState();
}

class _ChatRommState extends State<ChatRoom> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.pink,
    backgroundColor: Colors.pink,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  // variables
  TextEditingController _textEditingController = TextEditingController();
  List<String> _chats = [];
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();

  void _handleSubmitted(String text) {
    Logger().d(text);
    if (text.isEmpty) return;
    _textEditingController.clear();
    _chats.insert(0, text);
    _animListKey.currentState?.insertItem(0);
  }

  Widget _buildItem(context, index, animation) {
    return ChatMessage(txt: _chats[index], animation: animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: Column(
        children: [
          Expanded(
              child: AnimatedList(
            key: _animListKey,
            reverse: true,
            itemBuilder: _buildItem,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: "메세지 입력창"),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                  child: Text("Send", style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
