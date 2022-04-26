import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightsPage extends StatelessWidget {
  const FlightsPage({Key? key}) : super(key: key);
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final _suggestions = <String>[];
    return MaterialApp(
      title: "Flutter list",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter list"),
          ),
          body: ListView.builder(itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateValue()); /*4*/
            }
            return ListTile(
              title: Text(
                _suggestions[index],
                style: _biggerFont,
              ),
            );
          })),
    );
  }

  List<String> generateValue() {
    return ["ds", "dsds", "dsds"];
  }
}
