import 'package:calculator/calculator_button.dart';
import 'package:calculator/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

import 'menu.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = "";
  String result = "";

  List<Menu> _buttonList = [];

  @override
  void initState() {
    super.initState();
    _buttonList = [
      Menu(
          label: "Ac",
          color: CustomTheme.orangeColor,
          onpressed: () {
            expression = "";
            result = "";
          }),
      Menu(
          label: "C",
          color: CustomTheme.orangeColor,
          onpressed: () {
            if (expression.isNotEmpty) {
              expression = expression.substring(0, expression.length - 1);
            }
          }),
      Menu(label: "%", color: CustomTheme.orangeColor),
      Menu(label: "/", color: CustomTheme.orangeColor),
      Menu(label: "7"),
      Menu(label: "8"),
      Menu(label: "9"),
      Menu(
        label: "x",
        color: CustomTheme.orangeColor,
        onpressed: (){
          expression += "*";
        }
      ),
      Menu(label: "4"),
      Menu(label: "5"),
      Menu(label: "6"),
      Menu(label: "-", color: CustomTheme.orangeColor),
      Menu(label: "1"),
      Menu(label: "2"),
      Menu(label: "3"),
      Menu(label: "+", color: CustomTheme.orangeColor),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              result,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: CustomTheme.white,
                fontSize: 65,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              expression,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: CustomTheme.textColor,
                fontSize: 55,
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CalculatorButton(
                label: _buttonList[index].label,
                txtColor: _buttonList[index].color,
                onPressed: () {
                  if(_buttonList[index].onpressed!=null){
                    _buttonList[index].onpressed!();
                  }else{
                    expression += _buttonList[index].label;
                  }
                  setState(() {});
                },
              );
            },
            itemCount: _buttonList.length,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CalculatorButton(
                label: "0",
                height: 80,
                width: 80,
                onPressed: () {
                  setState(() {
                    expression += "0";
                  });
                },
              ),
              SizedBox(
                width: 20,
              ),
              CalculatorButton(
                label: ".",
                height: 80,
                width: 80,
                onPressed: () {
                  setState(() {
                    expression += ".";
                  });
                },
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: CalculatorButton(
                  label: "=",
                  height: 80,
                  width: 80,
                  backgroundColor: CustomTheme.orangeColor,
                  txtColor: Colors.white,
                  onPressed: () {
                    if(expression.isNotEmpty){
                      try{
                        final parser = Parser();
                        final parsedExpression = parser.parse(expression);
                        result = (parsedExpression.evaluate(
                            EvaluationType.REAL, ContextModel()) as num)
                            .toStringAsFixed(2);
                        setState(() {});
                      }catch(e){
                        Fluttertoast.showToast(msg: "Invalid Format",);
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
