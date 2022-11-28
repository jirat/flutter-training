import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final List<String> _cal = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(widget.title),
          )),
      body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Expanded(
          child: Container(color: Colors.black),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Container(
                color: Colors.black,
                height: 100,
                width: double.infinity,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      _cal.join(),
                      textAlign: TextAlign.right,
                      softWrap: false,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(1.0),
                          fontSize: 50.00),
                    )))),
        Column(
          children: [
            buildNumpad(),
            finalRow(),
          ],
        )
      ]),
    );
  }

  Widget buildNumpad() {
    return Container(
        color: Colors.black,
        height: 400,
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          crossAxisCount: 4,
          children: [
            generateButton('C', Colors.grey, Colors.black),
            generateButton('+/-', Colors.grey, Colors.black),
            generateButton('%', Colors.grey, Colors.black),
            generateButton('/', Colors.orange, Colors.white),
            generateButton(
                '1', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '2', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '3', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton('x', Colors.orange, Colors.white),
            generateButton(
                '4', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '5', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '6', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton('-', Colors.orange, Colors.white),
            generateButton(
                '7', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '8', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton(
                '9', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton('+', Colors.orange, Colors.white),
          ],
        ));
  }

  Widget generateButton(String text, Color color, Color fontColor) {
    return ElevatedButton(
        onPressed: () => {addText(text)},
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20)),
        child: Text(text,
            style: TextStyle(
                fontSize: 30, color: fontColor, fontWeight: FontWeight.bold)));
  }

  Widget finalRow() {
    return Container(
        color: Colors.black,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            zeroButton(),
            generateButton(
                '.', const Color.fromARGB(255, 92, 92, 92), Colors.white),
            generateButton('=', Colors.orange, Colors.white)
          ],
        ));
  }

  Widget zeroButton() {
    return ElevatedButton(
        onPressed: () => {addText('0')},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70)),
        child: const Text('0',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  void addText(String text) {
    setState(() {
      _cal.add(text);
    });
  }
}
