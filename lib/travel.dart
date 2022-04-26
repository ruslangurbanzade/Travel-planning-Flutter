import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_planning/FlightRepository.dart';
import 'package:travel_planning/flights.dart';
import 'package:travel_planning/presentation/travel_app_icons.dart';

class TravelPage extends StatefulWidget {
  final String title;

  const TravelPage({Key? key, required this.title}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPage();
}

class _TravelPage extends State<TravelPage> {

  String title = "Not selected";

  void updateTitle(String newTitle) {
    setState(() {
      title = newTitle;
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
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(TravelApp.card_travel, size: 50),
                title: Text(title),
                subtitle: Text('My Flight'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FlightsPage()),
                  ).then((value) {

                    FlightRepository().getSelectedFlightNumber().then((value)
                    {
                      if (value != null) {
                        updateTitle(value);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Flight selected!")));
                      }
                    }
                    );
                  }
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
