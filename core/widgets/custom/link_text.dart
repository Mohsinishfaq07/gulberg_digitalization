import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  LinkText({
    Key? key,
    required this.title,
    this.color = Colors.blue,
    this.onTap,
  }) : super(key: key);
  final String title;
  final Color color;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}
