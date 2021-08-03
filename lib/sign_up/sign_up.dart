import 'package:firexample/image_selection/user_image.dart';
import 'package:firexample/widgets/app_toolbar.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(title: 'Sign up', appBar: AppBar()),
      body: ListView(children: [
        const SizedBox(height: 15),
        UserImage(
          onFileChanged: (imageUrl) {
            setState(() {
              this.imageUrl = imageUrl;
            });
          },
        ),
      ]),
    );
  }
}
