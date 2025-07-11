import 'package:app/constants/constants.dart';
import 'package:app/widgets/graph(CustomerWidget).dart';
import 'package:app/widgets/imageOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String activeOrdersText;
  final String pendingOrdersText;
  final int activeOrderCount;
  final int pendingOrderCount;
  final List<String> activeAvatars;
  final List<String> pendingAvatars;
  final double activesub;
  final String? activeSubtext;

  const Customer({
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
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      height: screenHeight * 0.35,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColors.mintGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left - Illustration + Button
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration Circle
                  Container(
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pinkAccent,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: SvgPicture.asset(
                        'assets/images/customers-illustration-image.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pinkMagenta,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.01,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'View Customers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Right - Info cards + avatars
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Active Orders
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double cardHeight = constraints.maxHeight;
                        double cardWidth = constraints.maxWidth;
                        double avatarSize = cardHeight * 0.9;
                        double overlapOffset = avatarSize * 0.1;

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildInfoCard(
                              screenWidth,
                              screenHeight,
                              text: activeOrdersText,
                              count: activeOrderCount,
                              color: AppColors.pinkMagenta,
                              textColor: AppColors.white,
                            ),
                            Positioned(
                              bottom: -avatarSize * 0.1,
                              left: cardWidth * 0.01,
                              child: buildOverlappingAvatars(
                                activeAvatars,
                                avatarSize,
                              ),
                            ),
                            Positioned(
                                bottom: avatarSize * 0.27,
                                left: cardWidth * 0.55,
                                child: Icon(Icons.add_circle_outlined,
                                    size: avatarSize * 0.29,
                                    color: Colors.white)),
                          ],
                        );
                      },
                    ),
                  ),

                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: StatCard(),
                  ),
                  // Pending Orders
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double cardHeight = constraints.maxHeight;
                        double cardWidth = constraints.maxWidth;
                        double avatarSize = cardHeight * 0.99;
                        double overlapOffset = avatarSize * 0.1;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                _buildInfoCard(
                                  screenWidth,
                                  screenHeight,
                                  text: pendingOrdersText,
                                  count: pendingOrderCount,
                                  color: AppColors.white,
                                  textColor: Colors.black87,
                                ),
                                Positioned(
                                  bottom: -avatarSize * 0.1,
                                  left: cardWidth * 0.33,
                                  child: buildOverlappingAvatars(
                                    activeAvatars,
                                    avatarSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.006),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    double screenWidth,
    double screenHeight, {
    required String text,
    required int count,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.45,
        minHeight: screenHeight * 0.07,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: textColor,
              height: 1.1,
            ),
            children: [
              TextSpan(
                text: '$count ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.032,
                ),
              ),
              TextSpan(
                text: text,
                style: TextStyle(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
