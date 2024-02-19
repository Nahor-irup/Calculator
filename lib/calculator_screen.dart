import 'package:calculator/calculator_button.dart';
import 'package:calculator/custom_theme.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalculatorButton(
                label: "Ac",
                txtColor: CustomTheme.orangeColor,
              ),
              SizedBox(width: 20,),
              CalculatorButton(
                label: "C",
                txtColor: CustomTheme.orangeColor,
              ),
              SizedBox(width: 20,),
              CalculatorButton(
                label: "%",
                txtColor: CustomTheme.orangeColor,
              ),
              SizedBox(width: 20,),
              CalculatorButton(
                label: "/",
                txtColor: CustomTheme.orangeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
