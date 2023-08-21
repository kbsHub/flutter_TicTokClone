import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isUserInputEmpty,
  });

  final bool isUserInputEmpty;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: isUserInputEmpty
                ? Colors.grey
                : Theme.of(context).primaryColor),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
              color: isUserInputEmpty ? Colors.white54 : Colors.white,
              fontSize: Sizes.size20),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
