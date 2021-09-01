import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  String output = "0";
  String _output = "0";
  double n1 = 0.0;
  double n2 = 0.0;
  String operand ="";

  operation(String btntext) {
    if (btntext == "C") {
      _output = "0";
      n2 = 0.0;
      n1 = 0.0;
      operand = "";
    }
    else
    if (btntext == "+" || btntext == "-" || btntext == "*" || btntext == "/") {
      n1 = double.parse(output);
      operand = btntext;
      _output = "0";
    }
    else if (btntext == "=") {
      n2 = double.parse(output);

      if (operand == "+") {
        _output = (n1 + n2).toString();
      }
      if (operand == "-") {
        _output = (n1 - n2).toString();
      }
      if (operand == "*") {
        _output = (n1 * n2).toString();
      }
      if (operand == "/") {
        _output = (n1 / n2).toString();
      }

      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    }
    else {
      _output = _output + btntext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }
  Widget button(String btntext){
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                border: Border.all(color: Colors.white)
            ),
            child: RawMaterialButton(
              child: Text("$btntext",style: TextStyle(fontSize: 35,color: Colors.white),),
              onPressed: () {
                operation(btntext);
              },
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    child: Text('$output',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.orange),),
                  )
              ),
              Row(
                children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("*"),
                ],
              ),
              Row(
                children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("-"),
                ],
              ),
              Row(
                children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("/"),
                ],
              ),
              Row(
                children: [
                  button("0"),
                  button("C"),
                  button("="),
                  button("+"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
