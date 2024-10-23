import 'package:app/date.dart';
import 'package:app/ordercomponent.dart';
import 'package:app/ordernotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
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
                  FloatingActionButton(elevation: 50,
                    backgroundColor: Colors.white,
                    shape: CircleBorder(),
                    onPressed: () {
                      // Add search action here
                    },
                    child: SvgPicture.asset(
                'assets/images/Group 922.svg',width: 100,
                
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
                decoration: BoxDecoration(
                  color: Colors.cyan[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: screenHeight * 0.3, // Responsive container height
                width: screenWidth * 0.9, // Responsive container width
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // First Page
                    Stack(
                      children: [
                        Positioned(
                          top: screenHeight * 0.05,
                          left: screenWidth * 0.05,
                          child: Container(
                            width: screenWidth * 0.25, // Responsive size
                            height: screenWidth * 0.25, // Responsive size
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.note,
                              size: screenWidth * 0.15, // Responsive icon size
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.01,
                          right: screenWidth * 0.1,
                          child: OrderInfoWidget(
                            numberOfOrders: 3,
                            status: 'Active',
                            imageUrls: const [
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                            ],
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        Positioned(
                        bottom: screenHeight * 0.03,
                        right: screenWidth * 0.2,
                        child: OrderInfoWidget(
                          numberOfOrders: 3,
                          status: 'Pending',
                          imageUrls: const [
                            'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                            'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                          ],
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                        ),
                      ),
                        Positioned(
                          bottom: screenHeight * 0.03,
                          left: screenWidth * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                              ), // Responsive padding
                              child: Text('Orders'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Second Page
                    Stack(
                      children: [
                        Positioned(
                          top: screenHeight * 0.03,
                          left: screenWidth * 0.05,
                          child: Container(
                            width: screenWidth * 0.25, // Responsive size
                            height: screenWidth * 0.25, // Responsive size
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.note,
                              size: screenWidth * 0.15, // Responsive icon size
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.02,
                          right: screenWidth * 0.2,
                          child: OrderInfoWidget(
                            numberOfOrders: 3,
                            status: 'Pending',
                            imageUrls:const  [
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                            ],
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                        ),
                        Positioned(
                          bottom: screenHeight * 0.03,
                          left: screenWidth * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                              ), // Responsive padding
                              child: Text('Orders'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Third Page
                    Stack(
                      children: [
                        Positioned(
                          top: screenHeight * 0.03,
                          left: screenWidth * 0.05,
                          child: Container(
                            width: screenWidth * 0.25, // Responsive size
                            height: screenWidth * 0.25, // Responsive size
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.note,
                              size: screenWidth * 0.15, // Responsive icon size
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.02,
                          right: screenWidth * 0.2,
                          child: OrderInfoWidget(
                            numberOfOrders: 3,
                            status: 'Completed',
                            imageUrls: const [
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                              'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                            ],
                            backgroundColor: Colors.green,
                          ),
                        ),
                        Positioned(
                          bottom: screenHeight * 0.03,
                          left: screenWidth * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.03,
                              ), // Responsive padding
                              child: Text('Orders'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Responsive spacing
              DateSelectionWidget(),
              OrderNotificationCard(),
            ],
          ),
        ),
      ),
    );
  }
}









