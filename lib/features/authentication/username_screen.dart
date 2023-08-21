import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/authentication/email_screen.dart';
import 'package:flutter_tictok/features/authentication/widgets/form_button.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _userName = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onButtonTap() {
    if (_userName.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const EmailScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gaps.v8,
            const Text(
              "you can always change this later",
              style: TextStyle(color: Colors.black54),
            ),
            TextField(
              controller: _textEditingController,
              showCursor: true,
              cursorColor: Theme.of(context).primaryColor,
              decoration: const InputDecoration(
                hintText: AutofillHints.name,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Gaps.v28,
            GestureDetector(
              onTap: onButtonTap,
              child: FormButton(isUserInputEmpty: _userName.isEmpty),
            ),
          ],
        ),
      ),
    );
  }
}
