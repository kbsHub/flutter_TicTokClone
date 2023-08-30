import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/authentication/birthday_screen.dart';
import 'package:flutter_tictok/features/authentication/widgets/form_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _passWord = '';
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _passWord = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool _isPassWordValid() {
    return _passWord.isNotEmpty && _passWord.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onXmarkTap() {
    _textEditingController.clear();
  }

  void _onEyeTap() {
    _isVisible = !_isVisible;
    setState(() {});
  }

  void _onSubmit() {
    if (_isPassWordValid()) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BirthdayScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                "Make Strong password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.v8,
              const Text(
                "Make Strong passWord",
                style: TextStyle(color: Colors.black54),
              ),
              TextField(
                controller: _textEditingController,
                showCursor: true,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  hintText: AutofillHints.password,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: _onXmarkTap,
                        child: const FaIcon(
                          FontAwesomeIcons.xmark,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h8,
                      GestureDetector(
                        onTap: _onEyeTap,
                        child: FaIcon(
                          !_isVisible
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Gaps.v28,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPassWordValid() ? Colors.green : Colors.grey,
                  ),
                  Gaps.h10,
                  const Text(
                    "Make 8 to 20 characters",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Gaps.v32,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(isButtonValid: _isPassWordValid()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
