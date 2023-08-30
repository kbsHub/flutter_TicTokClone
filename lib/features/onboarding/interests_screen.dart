import 'package:flutter/material.dart';
import 'package:flutter_tictok/constants/gaps.dart';
import 'package:flutter_tictok/constants/sizes.dart';
import 'package:flutter_tictok/features/onboarding/tutorial_screen.dart';
import 'package:flutter_tictok/features/onboarding/widgets/interest_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _interestsList = [
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
    "Daily Life",
    "Comedy",
    "Entertainment",
    "Animals",
    "Food",
    "Beauty & Style",
    "Drama",
    "Learning",
    "Talent",
    "Sports",
    "Auto",
    "Family",
    "Fitness & Health",
    "DIY & Life Hacks",
    "Arts & Crafts",
    "Dance",
    "Outdoors",
    "Oddly Satisfying",
    "Home & Garden",
  ];

  final ScrollController _scrollController = ScrollController();
  bool _isShowTitle = false;

  void onScroll() {
    if (_scrollController.offset >= 100) {
      if (_isShowTitle) return;
      setState(() {
        _isShowTitle = true;
      });
    } else {
      if (_isShowTitle) {
        setState(() {
          _isShowTitle = false;
        });
      }
    }
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (contex) => const TutorialScreen()),
        (route) {
      return false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // 설정한 EventListener는 widget이 닫히면 같이 지워야 한다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AnimatedOpacity(
              opacity: _isShowTitle ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Text("Choose your interests"))),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size24,
          ),
          child: Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.v40,
                  const Text(
                    "Choose your interests",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Get better video recommendation",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size24,
                    ),
                  ),
                  Gaps.v40,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10, horizontal: Sizes.size10),
                    child: Wrap(
                        spacing: Sizes.size16,
                        runSpacing: Sizes.size12,
                        children: [
                          for (var interest in _interestsList)
                            InterestButton(interest: interest),
                        ]),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
          horizontal: Sizes.size24,
        ),
        child: GestureDetector(
          onTap: _onNextTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(Sizes.size8)),
            ),
            child: const Text(
              "Next",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
