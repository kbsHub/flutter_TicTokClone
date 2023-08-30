import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isButtonValid,
  });

  final bool isButtonValid;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color:
                isButtonValid ? Theme.of(context).primaryColor : Colors.grey),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
              color: isButtonValid ? Colors.white : Colors.white54,
              fontSize: Sizes.size20),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
