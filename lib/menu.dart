import 'package:calculator/custom_theme.dart';
import 'package:flutter/material.dart';

class Menu {
  final String label;
  final Color color;
  final VoidCallback? onpressed;

  Menu({
    required this.label,
    this.color = CustomTheme.textColor,
    this.onpressed,
  });
}
