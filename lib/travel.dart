import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_planning/flights.dart';
import 'package:travel_planning/presentation/travel_app_icons.dart';

class TravelPage extends StatefulWidget {
  final String title;

  const TravelPage({Key? key, required this.title}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPage();
}

class _TravelPage extends State<TravelPage> {
  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan a trip"),
      ),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: const [CardItem()],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(TravelApp.card_travel, size: 50),
            title: Text('Heart Shaker'),
            subtitle: Text('TWICE'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FlightsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
