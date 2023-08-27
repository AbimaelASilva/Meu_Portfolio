import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ProIconButton extends StatelessWidget {
  const ProIconButton({
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.iconSize = 24,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Function()? onPressed;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      icon: Icon(
        icon,
        color: iconColor ?? ProColors.orangeMedium,
      ),
      onPressed: onPressed,
    );
  }
}
