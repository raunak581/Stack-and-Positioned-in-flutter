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
    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      height: screenHeight * 0.35,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColors.turquoiseBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Main content using Row and Column for better responsiveness
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side - Avatar and Button
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar Circle
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
                            'assets/images/orders-illustration-image.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Orders Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.coralRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.08,
                            vertical: screenHeight * 0.01,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Orders',
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
                // Right side - Order Information
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Active Orders Card
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: LayoutBuilder(builder: (context, constraints) {
                            double cardHeight = constraints.maxHeight;
                            double cardWidth = constraints.maxWidth;
                            double avatarSize =
                                cardHeight * 0.95; // 50% of card height
                            double overlapOffset =
                                avatarSize * 0.1; // adjust overlap spacing

                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                _buildOrderCard(
                                  context: context,
                                  count: activeOrderCount,
                                  text: activeOrdersText,
                                  avatars: activeAvatars,
                                  backgroundColor:AppColors.coralRed,
                                  textColor:AppColors.white,
                                  isActive: true,
                                ),
                                Positioned(
                                  bottom: -avatarSize *
                                      0.01, // push it below the card
                                  left: cardWidth *
                                      0.01, // adjust horizontally as needed
                                  child: buildOverlappingAvatars(
                                    activeAvatars,
                                    avatarSize,
                                  ),
                                ),
                              ],
                            );
                          })),
                      // SizedBox(height: screenHeight * 0.015),
                      // Pending Orders Card
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
                                _buildOrderCard(
                                  context: context,
                                  count: pendingOrderCount,
                                  text: pendingOrdersText,
                                  avatars: pendingAvatars,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black87,
                                  isActive: false,
                                ),
                                Positioned(
                                  bottom: -avatarSize *
                                      0.01, // push it below the card
                                  left: -cardWidth *
                                      0.1, // adjust horizontally as needed
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required BuildContext context,
    required int count,
    required String text,
    required List<String> avatars,
    required Color backgroundColor,
    required Color textColor,
    required bool isActive,
  }) {
    return Column(
      // mainAxisAlignment:
      //     MainAxisAlignment.spaceAround, // <-- Pushes avatars to bottom
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Order Info Container (Top)
        Container(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.45,
            minHeight: screenHeight * 0.05,
            maxHeight: screenHeight * 0.08,
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.04,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
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
                  if (isActive) const TextSpan(text: 'You have '),
                  TextSpan(
                    text: '$count ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.032,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: TextStyle(
                      color: isActive ? textColor : Colors.grey[600],
                    ),
                  ),
                  if (!isActive) const TextSpan(text: ' Orders from'),
                ],
              ),
            ),
          ),
        ),

        // Avatars (Bottom)
        // if (avatars.isNotEmpty)
        //   SizedBox(
        //     height: screenHeight * 0.05,
        //     child: Align(
        //       alignment: Alignment.topRight,
        //       child: buildOverlappingAvatars(avatars, screenWidth * 0.15),
        //     ),
        //   ),
      ],
    );
  }
}
