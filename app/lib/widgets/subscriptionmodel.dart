import 'package:app/constants/constants.dart';
import 'package:app/widgets/imageOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubscriptionCardWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String activeOrdersText;
  final String pendingOrdersText;
  final int activeOrderCount;
  final int pendingOrderCount;
  final List<String> activeAvatars;
  final List<String> pendingAvatars;
  final int activesub;
  final String activeSubtext;

  const SubscriptionCardWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.activeOrdersText,
    required this.pendingOrdersText,
    required this.activeOrderCount,
    required this.pendingOrderCount,
    required this.activeAvatars,
    required this.pendingAvatars,
    this.activesub = 0,
    this.activeSubtext = '',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.4,
            maxWidth: screenWidth * 0.95,
          ),
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(20),
            ),
            height: screenHeight * 0.3,
            width: screenWidth * 0.9,
          ),
        ),
        Positioned(
          top: screenHeight * 0.04,
          left: screenWidth * 0.10,
          child: Container(
            width: screenWidth * 0.3,
            height: screenWidth * 0.3,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
            ),
            child: SvgPicture.asset(
              'assets/images/subscriptions-illustration-image.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.electricBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: const Text(
                'Subscriptions',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.02,
          right: screenWidth * 0.19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.electricBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: activeOrderCount.toString().padLeft(2, '0'),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: activeOrdersText),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.1,
          left: screenWidth * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: '$pendingOrderCount ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: pendingOrdersText,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.21,
          left: screenWidth * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: '$activesub',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: 'Active\n'),
                          TextSpan(
                            text: activeSubtext,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.16,
          right: screenWidth * 0.13,
          child: buildOverlappingAvatars(
            activeAvatars,
          ),
        ),
      ],
    );
  }
}
