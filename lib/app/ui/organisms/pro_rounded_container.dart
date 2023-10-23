import 'package:flutter/material.dart';
import '../atoms/radius/pro_radius.dart';
import '../atoms/colors/pro_colors.dart';

class ProContainer extends StatelessWidget {
  const ProContainer({
    required this.child,
    this.borderWidth = 1.0,
    this.borderColor = Colors.transparent,
    this.backgroundColor,
    this.borderRadius = ProRadius.proRadiusAll12,
    this.paddingAllChild = 0,
    this.height,
    this.elevation = 0,
    this.constraints,
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
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: elevation,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Container(
          constraints: constraints,
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
