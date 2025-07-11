import 'package:app/widgets/customer.dart';
import 'package:app/constants/date.dart';
import 'package:app/widgets/ordernotification.dart';
import 'package:app/widgets/ordersComponent.dart';
import 'package:app/widgets/subscriptionmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = MediaQuery.of(context).size.width > 600
        ? screenHeight * 0.4 // tablet
        : screenHeight * 0.3; // phone

    final List<Map<String, dynamic>> cardData = [
      {
        'activeOrderCount': 3,
        'activeOrdersText': 'active\norders from',
        'pendingOrderCount': 2,
        'pendingOrdersText': 'Pending\n',
        'activeAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
        'pendingAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
      },
      {
        'activeOrderCount': 03,
        'activeOrdersText': 'deliveries',
        'pendingOrderCount': 119,
        'pendingOrdersText': 'Pending\ndeliveries',
        'activesub': 2,
        'activeSubtext': 'Subscriptions',
        'activeAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
        'pendingAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
      },
      {
        'activeOrderCount': 15,
        'activeOrdersText': 'New Customers',
        'activesub': 1.8,
        // 'activeSubtext': 'Subscriptions',
        'pendingOrderCount': 4,
        'pendingOrdersText': 'Active\nCustomers',
        'activeAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
        'pendingAvatars': [
          'assets/images/omakr.png',
          'assets/images/omakr.png',
          'assets/images/omakr.png',
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome, Mycot !!',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FloatingActionButton(
                        elevation: 50,
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/images/Group 922.svg',
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Here is your dashboard....',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing

                  Container(
                    constraints: BoxConstraints(
                      minHeight: cardHeight,
                    ),
                    height: cardHeight, // Responsive height
                    width: double.infinity,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.95),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final data = cardData[index];
                        switch (index) {
                          case 0:
                            return OrderCardWidget(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              activeOrderCount: data['activeOrderCount'],
                              activeOrdersText: data['activeOrdersText'],
                              pendingOrderCount: data['pendingOrderCount'],
                              pendingOrdersText: data['pendingOrdersText'],
                              activeAvatars: data['activeAvatars'],
                              pendingAvatars: data['pendingAvatars'],
                            );
                          case 1:
                            return SubscriptionCardWidget(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              activeOrderCount: data['activeOrderCount'],
                              activeOrdersText: data['activeOrdersText'],
                              pendingOrderCount: data['pendingOrderCount'],
                              pendingOrdersText: data['pendingOrdersText'],
                              activeAvatars: data['activeAvatars'],
                              pendingAvatars: data['pendingAvatars'],
                              activesub: data['activesub'],
                              activeSubtext: data['activeSubtext'],
                            );
                          case 2:
                            return Customer(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              activeOrderCount: data['activeOrderCount'],
                              activeOrdersText: data['activeOrdersText'],
                              pendingOrderCount: data['pendingOrderCount'],
                              pendingOrdersText: data['pendingOrdersText'],
                              activeAvatars: data['activeAvatars'],
                              pendingAvatars: data['pendingAvatars'],
                              activesub: data['activesub'],
                              activeSubtext: data['activeSubtext'],
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ),

                  // SizedBox(height: screenHeight * 0.01), // Responsive spacing
                  DateSelectionWidget(),
                  OrderNotificationCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
