import 'package:flutter/material.dart';
import '../radius/pro_radius.dart';
import '../colors/pro_colors.dart';

class ProContainer extends StatelessWidget {
  const ProContainer({
    required this.child,
    this.borderWidth = 1.0,
    this.borderColor = Colors.transparent,
    this.backgroundColor,
    this.borderRadius = ProRadius.proRadiusAll16,
    this.paddingAllChild = 0,
    this.height,
    this.elevation = 0,
    super.key,
  });

  final Widget child;

  final double borderWidth;
  final Color borderColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final double? height;
  final double paddingAllChild;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: elevation,
        borderRadius: borderRadius,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? ProColors.white,
            borderRadius: borderRadius,
            border: borderRadius != null
                ? Border.all(
                    color: borderColor,
                    width: borderWidth,
                  )
                : null,
          ),
          child: Padding(
            padding: EdgeInsets.all(paddingAllChild),
            child: child,
          ),
        ));
  }
}
