import 'package:crud_operations/core/theme/color.dart';
import 'package:flutter/material.dart';


class NeuBox extends StatelessWidget {
  const NeuBox({Key? key, this.child, this.width, this.height})
      : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final double blurRadius;
    final Offset offset;

    // Set blur radius and offset based on the current theme
    if (theme.brightness == Brightness.light) {
      blurRadius = 15.0; // Light theme blur radius
      offset = const Offset(5, 5); // Light theme offset
    } else {
      blurRadius = 2.0; // Dark theme blur radius
      offset = const Offset(1, 2); // Dark theme offset
    }

    return Container(
      width: width ?? 50,
      height: height ?? 50,
      child: Center(
        child: child,
      ),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light
            ? AppColor.neuBoxColorLight // Light theme color
            : AppColor.neuBoxColorDark, // Dark theme color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? AppColor.neuBoxShadowColorBRLight // Light theme shadow color
                : AppColor.neuBoxShadowColorBRDark, // Dark theme shadow color
            blurRadius: blurRadius,
            offset: offset,
          ),
          BoxShadow(
            color: theme.brightness == Brightness.light
                ? AppColor.neuBoxShadowColorTLLight // Light theme shadow color
                : AppColor.neuBoxShadowColorTLDark, // Dark theme shadow color
            blurRadius: blurRadius,
            offset: -offset,
          ),
        ],
      ),
    );
  }
}
