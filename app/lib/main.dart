import 'package:app/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {

  // debugPaintSizeEnabled = true; // Add this before runApp()
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/Group 919.svg',
              width: 18,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/Group 921.svg',
                width: 40,
              ),
              onPressed: () {
                // Add favorite action here
              },
            ),
            Stack(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/Group 917.svg',
                    width: 20,
                  ),
                  onPressed: () {
                    // Add notification action here
                  },
                ),
                Positioned(
                  right: 5,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/omakr.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover, // Ensures image fills the circle
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Dashboard(), // Placeholder for your dashboard content
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[900],
          shape: const CircleBorder(),
          elevation: 5,
          onPressed: () {
            // Add action for the FAB
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 65,
          color: Colors.white,
          shadowColor: Colors.blueAccent,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            height: 56, // Reduced height to fit content within BottomAppBar
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0), // Added padding for better spacing
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Home Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Home tap
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group 910.svg',
                        ),
                        const Text('Home', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                // Customers Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle Customers tap
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group 912.svg',
                        ),
                        const Text('Customers', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                // Khata Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group 913.svg',
                        ),
                        const Text('Khata', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                // Orders Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group 914.svg',
                        ),
                        const Text('Orders', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


