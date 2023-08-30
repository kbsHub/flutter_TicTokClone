import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void onInterestTap() {
    _isSelected = !_isSelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onInterestTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.size16),
          ),
          border: Border.all(color: Colors.black54, width: Sizes.size1),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.5),
              blurRadius: Sizes.size1,
              spreadRadius: Sizes.size1,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontSize: Sizes.size16,
            color: _isSelected ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}
