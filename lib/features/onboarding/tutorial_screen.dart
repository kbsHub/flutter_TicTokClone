import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';

import '../main_navigation/main_navigation_screen.dart';

enum Direction { left, right }

enum Page { first, second, third }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction? _direction;
  Page _page = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      _direction = Direction.right;
    }
    if (details.delta.dx < 0) {
      _direction = Direction.left;
    }
  }

  void _onPandEnd(DragEndDetails details) {
    if (_direction == Direction.right) {
      _page = Page.first;
    }
    if (_direction == Direction.left) {
      _page = Page.second;
    }
    setState(() {});
  }

  void _onPressed() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPandEnd,
      child: Scaffold(
        body: SafeArea(
          child: AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Gaps.v40,
                  Text(
                    "Enjoy Videos1",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size24,
                    ),
                  ),
                  Gaps.v40,
                ],
              ),
            ),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Gaps.v40,
                  Text(
                    "Watch Animnation",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size24,
                    ),
                  ),
                  Gaps.v40,
                ],
              ),
            ),
            crossFadeState: _page == Page.first
                ? CrossFadeState.showFirst
                : _page == Page.second
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 500),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size12, horizontal: Sizes.size20),
            child: AnimatedOpacity(
              opacity: _page == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: CupertinoButton(
                onPressed: _page == Page.first ? () {} : _onPressed,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "See Videos",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
