// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class ProActiveButton extends StatelessWidget {
  const ProActiveButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.height,
    this.width = 50,
    this.icon,
    this.isActive = true,
  }) : super(key: key);

  final String buttonName;
  final double height;
  final double width;
  final Function()? onPressed;
  final Widget? icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ButtonStyle(
            alignment: icon != null ? Alignment.centerLeft : Alignment.center,
            backgroundColor: MaterialStateProperty.all(
                isActive ? ProColors.orangeMedium : ProColors.grayDark)),
        child: Text(
          buttonName,
          style: TextStyle(
            color: ProColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
