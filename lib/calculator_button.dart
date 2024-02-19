import 'package:flutter/material.dart';

import 'custom_theme.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color txtColor,backgroundColor;
  final double height,width;


  const CalculatorButton({
    super.key,
    required this.label,
    this.backgroundColor = CustomTheme.primaryColor,
    this.txtColor = CustomTheme.textColor,
    this.height=80,
    this.width=80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: CustomTheme.shadowColor1,
            offset: Offset(2,4),
            blurRadius: 4,
            spreadRadius: 3,
          ),
          BoxShadow(
            color: CustomTheme.shadowColor2,
            offset: Offset(-2,-4),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: txtColor,
          fontSize: 40,
        ),
      ),
    );;
  }
}
