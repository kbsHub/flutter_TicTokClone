import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/authentication/login_form_screen.dart';
import 'package:flutter_tictok/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLogIn1Tap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Log In for TicTok",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              const Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v40,
              AuthButton(
                text: "Use email / username",
                icon: const FaIcon(FontAwesomeIcons.user),
                onButtonTap: _onLogIn1Tap,
              ),
              Gaps.v16,
              AuthButton(
                text: "Continue with Google",
                icon: const FaIcon(FontAwesomeIcons.google),
                onButtonTap: _onLogIn1Tap,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        color: Colors.white.withOpacity(0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: Sizes.size16),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onSignUpTap(context),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
