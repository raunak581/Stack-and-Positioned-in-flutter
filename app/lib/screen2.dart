import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_picture.png'),
                radius: 18,
              ),
            ),
          ],
        ),
        body: Dashboard(),
        
      ),
    );
  }
}


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, Mycot !!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FloatingActionButton(
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
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Here is your dashboard....',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan[700],
                borderRadius: BorderRadius.circular(16),
              ),
              height: 220,
              width: MediaQuery.sizeOf(context).width / 1.2,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent,
                      ),
                      child: Icon(
                        Icons.note,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 100,
                    child: OrderInfoWidget(
                      numberOfOrders: 3,
                      status: 'active',
                      imageUrls: [
                        'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                        'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                        'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                      ],
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 100,
                    child: OrderInfoWidget(
                      numberOfOrders: 3,
                      status: 'Pending',
                      imageUrls: [
                        'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                        'https://th.bing.com/th/id/OIG.H858xksBGr2D8tqa54ZW?pid=ImgGn',
                      ],
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Orders'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            DateSelectionWidget(),
          ],
        ),
      ),
    );
  }
}


class DateSelectionWidget extends StatefulWidget {
  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  DateTime selectedDate = DateTime.now();

  // Method to get the days of the current week
  List<DateTime> getCurrentWeekDays() {
    DateTime today = DateTime.now();
    int currentWeekday = today.weekday;
    DateTime startOfWeek = today.subtract(Duration(days: currentWeekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> currentWeekDays = getCurrentWeekDays();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(maxLines: 2,
                DateFormat('MMMM, dd yyyy').format(DateTime.now())+"\nToday",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'TIMELINE',
                  items: <String>['TIMELINE', 'EVENTS', 'NOTES']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    
                  },
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today, color: Colors.black,),
                label: Text(
                  DateFormat('MMM, yyyy').format(DateTime.now()),
                  style: TextStyle(color: Colors.black, ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: currentWeekDays.map((date) {
              bool isSelected = date.day == selectedDate.day;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEE').format(date).toUpperCase(),
                      style: TextStyle(color: isSelected ? Colors.black : Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (isSelected)
                      Container(
                        width: 4,
                        height: 4,
                        margin: EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

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
    this.backgroundColor = Colors.orange,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: numberOfOrders.toString().padLeft(2, '0') + ' ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: '$status\nOrders from',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageUrls
                .map(
                  (url) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(url),
                        radius: 16,
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
