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
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      height: screenHeight * 0.35,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColors.goldenYellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Circle + Button
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        'assets/images/subscriptions-illustration-image.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.electricBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.01,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Subscriptions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Right Side Info Cards
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double cardHeight = constraints.maxHeight;
                        double cardWidth = constraints.maxWidth;
                        double avatarSize =
                            cardHeight * 0.95; // 50% of card height
                        double overlapOffset =
                            avatarSize * 0.1; // adjust overlap spacing

                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _buildInfoCard(
                              title: activeOrdersText,
                              count: activeOrderCount,
                              bgColor:AppColors.electricBlue,
                                          textColor:AppColors.white,
                            ),
                            Positioned(
                              bottom:
                                  -avatarSize * 0.5, // push it below the card
                              left: cardWidth *
                                  0.001, // adjust horizontally as needed
                              child: buildOverlappingAvatars(
                                activeAvatars,
                                avatarSize,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // Active Subscriptions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: _buildInfoCard(
                          title: 'Active',
                          count: activesub,
                          subtitle: activeSubtext,
                          bgColor: Colors.white,
                          textColor: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // Pending Orders + Avatars
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: screenWidth * 0.02,
                        bottom: screenHeight * 0.01,
                      ),
                      child: _buildInfoCard(
                        title: pendingOrdersText,
                        count: pendingOrderCount,
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required int count,
    required Color bgColor,
    required Color textColor,
    String? subtitle,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight * 0.03,
        maxHeight: screenHeight * 0.06,
        maxWidth: screenWidth * 0.5,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: bgColor,
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '$title\n'),
              if (subtitle != null)
                TextSpan(
                  text: subtitle,
                  style: TextStyle(color: Colors.grey[600]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
