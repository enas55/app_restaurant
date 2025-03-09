import 'package:app_restaurant/utils/colors_utility.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OnboardingData extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath1;
  final String imagePath2;
  final VoidCallback onSkipPressed;
  final VoidCallback onForwardPressed;

  const OnboardingData({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath1,
    required this.imagePath2,
    required this.onSkipPressed,
    required this.onForwardPressed,
  });

  @override
  State <OnboardingData> createState() => _OnboardingDataState();
}

class _OnboardingDataState extends State<OnboardingData> {

  double _opacity1 = 0;
  double _opacity2 = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        _opacity1 = 1;
      });
    });

    Timer(const Duration(milliseconds: 900), () {
      setState(() {
        _opacity2 = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 500,
            height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: AnimatedOpacity(
                        opacity: _opacity1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        child: Image.asset(
                          widget.imagePath1,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  child: Transform.rotate(
                    angle: -0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: AnimatedOpacity(
                        opacity: _opacity2,
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.easeInOut,
                        child: Image.asset(
                          widget.imagePath2,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                color: ColorsUtility.onboardingColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              widget.description,
              style: const TextStyle(
                color: ColorsUtility.onboardingDescriptionColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: widget.onSkipPressed,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: ColorsUtility.onboardingColor,
                    fontSize: 16,
                  ),
                ),
              ),
              IconButton(
                onPressed: widget.onForwardPressed,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorsUtility.onboardingColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
