import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;
  final Animation<double> animation;

  const ChatMessage({Key? key, required this.txt, required this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1.0,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text('Hey'),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID or Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(txt),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
