import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  double screenWidth = MediaQuery.of(context).size.width;
  List<DateTime> currentWeekDays = getCurrentWeekDays();

  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(screenWidth * 0.06), 
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "${DateFormat('MMMM, dd yyyy').format(DateTime.now())}\nToday",
                style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: screenWidth * 0.035, // Responsive font size
                ),
              ),
            ),
            // Wrap the DropdownButton with Flexible to avoid overflow
            Flexible(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true, // Allow DropdownButton to take available space
                  value: 'TIMELINE',
                  items: <String>['TIMELINE', 'EVENTS', 'NOTES']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        overflow: TextOverflow.ellipsis, // Avoid text overflow
                        style: TextStyle(fontSize: screenWidth * 0.03), // Adjust font size if needed
                      ),
                    );
                  }).toList(),
                  onChanged: (_) {
                    // Handle change
                  },
                ),
              ),
            ),
            Flexible(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                  size: screenWidth * 0.05, // Responsive icon size
                ),
                label: Text(
                  DateFormat('MMM, yyyy').format(DateTime.now()),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.03), // Responsive spacing
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            children: currentWeekDays.map((date) {
              bool isSelected = date.day == selectedDate.day;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = date;
                  });
                },
                child: Container(
                  width: screenWidth * 0.12, // Set a fixed width for each date item
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), // Add spacing between items
                  child: Column(
                    children: [
                      Text(
                        DateFormat('EEE').format(date).toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: isSelected ? const Color.fromARGB(255, 57, 102, 11) : Colors.grey,
                          fontSize: screenWidth * 0.035, // Responsive font size
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.01), // Responsive spacing
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ?const Color.fromARGB(255, 57, 102, 11): Colors.grey,
                          fontSize: screenWidth * 0.04, // Responsive font size
                        ),
                      ),
                      if (isSelected)
                        Container(
                          width: screenWidth * 0.02, // Responsive size
                          height: screenWidth * 0.02, // Responsive size
                          margin: EdgeInsets.only(top: screenWidth * 0.01), // Responsive margin
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
}