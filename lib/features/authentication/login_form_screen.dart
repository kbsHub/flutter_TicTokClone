import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/authentication/widgets/form_button.dart';
import 'package:flutter_tictok/features/onboarding/interests_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const InterestsScreen()),
          (route) {
        return false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v32,
              TextFormField(
                decoration:
                    const InputDecoration(hintText: AutofillHints.email),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  formData["email"] = newValue;
                },
              ),
              Gaps.v40,
              TextFormField(
                decoration:
                    const InputDecoration(hintText: AutofillHints.password),
                obscureText: true,
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  formData["password"] = newValue;
                },
              ),
              Gaps.v32,
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(isButtonValid: true),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
