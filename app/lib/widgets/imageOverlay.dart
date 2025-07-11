import 'package:flutter/widgets.dart';

Widget buildOverlappingAvatars(List<String> imagePaths, double avatarSize) {
  return SizedBox(
    height: avatarSize,
    width: avatarSize + (imagePaths.length - 1) * (avatarSize * 0.6),
    child: Stack(
      children: List.generate(imagePaths.length, (index) {
        return Positioned(
          left: index * avatarSize * 0.3,
          child: ClipOval(
            child: Image.asset(
              imagePaths[index],
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    ),
  );
}
