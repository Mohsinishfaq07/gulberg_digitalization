import 'package:flutter/material.dart';
import 'package:sb_myreports/core/widgets/custom/custom_scroll_config.dart';

/// Gives the look of bottom sheet to container
class BottomSheetDecoration extends StatelessWidget {
  BottomSheetDecoration({
    Key? key,
    required this.children,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    this.isScrollable = false,
    this.backgroundColor = Colors.white,
    this.height,
  }) : super(key: key);
  final List<Widget> children;
  final EdgeInsets padding;
  final Color backgroundColor;

  /// must provide height variable otherwise will be zero and may not be shown
  final bool isScrollable;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: isScrollable
          ? SizedBox(
              height: height,
              child: ScrollConfiguration(
                behavior: CustomNoGlowScrollBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ),
            )
          : SizedBox(
              height: height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
    );
  }
}
