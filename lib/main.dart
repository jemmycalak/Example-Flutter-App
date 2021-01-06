import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calak App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calak App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var output = "0";
  var _output = "0";
  var num1 = 0.0;
  var num2 = 0.0;
  var operand = "";

  onButtonPressed(String keyword) {
    switch(keyword) {
      case "CLEAR": {
        output = "0";
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      }
      break;

      case "+":
      case "-":
      case "X":
      case "/":{
        num1 = double.parse(output);
        operand = keyword;
        _output = "0";
      }
      break;
      case ".": {
        if (!_output.contains(".")) {
          _output += keyword;
        }
      }
      break;
      case "=": {
        num2 = double.parse(output);
        if(operand == "+") {
          _output = "${(num1+num2)}";
        }
        if(operand == "-") {
          _output = "${(num1-num2)}";
        }
        if(operand == "/") {
          _output = "${(num1/num2)}";
        }
        if(operand == "X") {
          _output = "${(num1*num2)}";
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      }
      break;
      default: {
        _output += keyword;
      }
      break;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget ButtonCalculator(String text) {
    return new Expanded(
      child: new MaterialButton(
        child: new Text(text,
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => onButtonPressed(text),
        color: Colors.white,
        textColor: Colors.black,
        padding: new EdgeInsets.all(30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Column(
          children: [
            new Container(
              padding: new EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50
              ),
              alignment: Alignment.centerRight,
              // color: Colors.white,
              child: new Text(output, style: new TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),),
            ),

            new Expanded(
              child: new Divider(),
            ),

            new Row(
              children: [
                ButtonCalculator("1"),
                ButtonCalculator("2"),
                ButtonCalculator("3"),
                ButtonCalculator("+"),
              ],
            ),
            new Row(
              children: [
                ButtonCalculator("4"),
                ButtonCalculator("5"),
                ButtonCalculator("6"),
                ButtonCalculator("-"),
              ],
            ),
            new Row(
              children: [
                ButtonCalculator("7"),
                ButtonCalculator("8"),
                ButtonCalculator("9"),
                ButtonCalculator("X"),
              ],
            ),
            new Row(
              children: [
                ButtonCalculator("."),
                ButtonCalculator("0"),
                ButtonCalculator("00"),
                ButtonCalculator("/"),
              ],
            ),
            new Row(
              children: [
                ButtonCalculator("CLEAR"),
                ButtonCalculator("="),
              ],
            ),
          ],
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
