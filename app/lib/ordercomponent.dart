import 'package:flutter/material.dart';

class OrderInfoWidget extends StatelessWidget {
  final int numberOfOrders;
  final String status;
  final List<String> imageUrls;
  final Color backgroundColor;
  final Color textColor;

  OrderInfoWidget({
    required this.numberOfOrders,
    required this.status,
    required this.imageUrls,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: numberOfOrders.toString().padLeft(2, '0') + ' ',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsive font size for the number
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: status,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // Smaller font size for the status
                    color: textColor.withOpacity(0.7),
                  ),
                ),
                TextSpan(
                  text: '\nOrders from',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03, // Font size for the "Orders from" label
                    color: textColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenWidth * 0.02), // Spacing between text and images
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageUrls
                .map(
                  (url) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.005),
                    child: CircleAvatar(
                      backgroundColor: Colors.red, // Border color
                      radius: screenWidth * 0.06, // Outer circle radius
                      child: CircleAvatar(
                        backgroundImage: AssetImage(url),
                        radius: screenWidth * 0.055, // Inner circle radius
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}