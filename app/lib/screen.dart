import 'package:flutter/material.dart';



import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      // Add menu action here
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Add favorite action here
                        },
                      ),
                      Stack(
                        children: [
                          IconButton(
                            icon: Icon(Icons.notifications),
                            onPressed: () {
                              // Add notification action here
                            },
                          ),
                          Positioned(
                            right: 5,
                            top: 3,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              constraints: BoxConstraints(
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        radius: 16,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Mypcot !!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'here is your dashboard....',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              OrderComponent(), // Display the OrderComponent
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        onPressed: () {
          // Add search action here
        },
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}

class OrderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Set a fixed width
      height: 200, // Set a fixed height
      decoration: BoxDecoration(
        color: Colors.blue[300], // Background color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand, // Make the Stack fill the available space
        children: [
          Positioned(
            left: 20,
            top: 30,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.assignment,
                      size: 50,
                      color: Colors.blue[300],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add action for the button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Orders"),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "You have ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "3 ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "active orders from",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  _buildAvatarStack([
                    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "02 ",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Pending Orders from",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(width: 5),
                  _buildAvatarStack([
                    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?q=80&w=1738&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack(List<String> imageUrls) {
    return Stack(
      children: List.generate(imageUrls.length, (index) {
        return Positioned(
          left: index * 20.0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrls[index]),
            radius: 12,
          ),
        );
      }),
    );
  }
}
