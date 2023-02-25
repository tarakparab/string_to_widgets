import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:string_to_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final text =
      'Equation for area of square is given by: /startEquation area = length^2 /endEquation in sq.m and /startEquation perimeter = length*4 /endEquation in metre where, /startSymbol length = side of the square. /endSymbol';

  final notations = ['Equation', 'Symbol'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: stringToWidgets(
              text: text,
              notations: notations,
              context: context,
              switchStatement: _switchStatement),
        ),
      ),
    );
  }

  Widget _switchStatement(
      int widgetIndex, String string, BuildContext context) {
    switch (widgetIndex) {
      case 0:
        return Center(
          child: Math.tex(
            string,
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        );

      case 1:
        var equation = string.split('=');

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Math.tex(
              equation[0],
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              ' = ${equation[1]}',
            ),
          ],
        );

      default:
        return Text(string);
    }
  }
}
