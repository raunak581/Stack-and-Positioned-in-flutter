  import 'package:flutter/material.dart';

Widget buildOverlappingAvatars(List<String> imagePaths) {
    return SizedBox(
      width: 120 + (imagePaths.length - 1) * 25,
      height: 200,
      child: Stack(
        children: List.generate(imagePaths.length, (index) {
          return Positioned(
            left: index * 30, // Controls overlap distance
            child: ClipOval(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover, // Fill the circle completely
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
