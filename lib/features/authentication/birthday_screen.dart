import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/authentication/widgets/form_button.dart';
import 'package:flutter_tictok/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  DateTime initialDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _onDateTimeChanged(initialDate);
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onDateTimeChanged(DateTime dateTime) {
    String day = dateTime.toString().split(" ").first;
    _textEditingController.value = TextEditingValue(text: day);
  }

  void _onSubmit() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const InterestsScreen()),
        (route) {
      return false;
    });
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
                "When's your birthDay?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.v8,
              const Text(
                "Your birthday won't be shown publicy",
                style: TextStyle(color: Colors.black54),
              ),
              Gaps.v40,
              TextField(
                enabled: false,
                controller: _textEditingController,
                showCursor: true,
                cursorColor: Theme.of(context).primaryColor,
                decoration: const InputDecoration(
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
                onTap: _onSubmit,
                child: const FormButton(isButtonValid: true),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              dateOrder: DatePickerDateOrder.ymd,
              mode: CupertinoDatePickerMode.date,
              maximumDate: initialDate,
              initialDateTime: initialDate,
              onDateTimeChanged: (value) => _onDateTimeChanged,
            ),
          ),
        ),
      ),
    );
  }
}
