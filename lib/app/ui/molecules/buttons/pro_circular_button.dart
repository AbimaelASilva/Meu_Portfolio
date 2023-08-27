import 'package:flutter/material.dart';
import '../../organisms/pro_rounded_container.dart';

import '../../colors/colors.dart';

class ProCircularButton extends StatelessWidget {
  const ProCircularButton({
    required this.icon,
    this.color,
    this.sizeIcon = 24,
    this.borderRadius,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final double sizeIcon;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeIcon,
      width: sizeIcon,
      child: ProContainer(
        borderColor: ProColors.white,
        borderRadius: borderRadius,
        height: sizeIcon,
        child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              icon,
              color: color ?? ProColors.white,
              size: sizeIcon * 0.7,
            ),
            onPressed: onPressed),
      ),
    );
  }
}
