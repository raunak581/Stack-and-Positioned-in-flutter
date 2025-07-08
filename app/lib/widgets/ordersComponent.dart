import 'package:app/constants/constants.dart';
import 'package:app/widgets/imageOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderCardWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String activeOrdersText;
  final String pendingOrdersText;
  final int activeOrderCount;
  final int pendingOrderCount;
  final List<String> activeAvatars;
  final List<String> pendingAvatars;

  const OrderCardWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.activeOrdersText,
    required this.pendingOrdersText,
    required this.activeOrderCount,
    required this.pendingOrderCount,
    required this.activeAvatars,
    required this.pendingAvatars,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.turquoiseBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            height: screenHeight * 0.3,
            width: screenWidth * 0.9,
          ),
        ),
        Positioned(
          top: screenHeight * 0.04,
          left: screenWidth * 0.08,
          child: Container(
            width: screenWidth * 0.3,
            height: screenWidth * 0.3,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent,
            ),
            child: SvgPicture.asset(
              'assets/images/orders-illustration-image.svg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.coralRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: const Text('Orders'),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.02,
          right: screenWidth * 0.12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.6,
                      maxHeight: screenHeight * 0.1,
                    ),
                    height: screenHeight * 0.09,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01,
                      horizontal: screenWidth * 0.025,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.coralRed,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(text: 'You have '),
                          TextSpan(
                            text: '$activeOrderCount ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: activeOrdersText),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -screenHeight * 0.13,
                    right: screenWidth * 0.005,
                    child: buildOverlappingAvatars(activeAvatars),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.12,
          left: screenWidth * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.6,
                      maxHeight: screenHeight * 0.08,
                    ),
                    height: screenHeight * 0.1,
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
                          const TextSpan(text: 'Orders from'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -screenHeight * 0.14,
                    right: screenWidth * 0.001,
                    child: buildOverlappingAvatars(pendingAvatars),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
