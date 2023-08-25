import 'package:flutter/material.dart';

import '../../const/color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.title,
    this.color = cAccentColor,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    this.onTap,
    this.isBusy = false,
    this.isActive = true,
  }) : super(key: key);
  final String title;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;
  final bool isActive;
  final bool isBusy;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            color: !isActive ? Colors.black26 : color,
            borderRadius: BorderRadius.circular(500)),
        child: isBusy
            ? const Center(
                child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(Colors.white)),
              )
            : Text(
                title,
                style: TextStyle(fontSize: sBodyText, color: textColor),
              ),
      ),
    );
  }
}
