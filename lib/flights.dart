import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_planning/FlightRepository.dart';
import 'package:travel_planning/pigeon.dart';
import 'package:travel_planning/presentation/travel_app_icons.dart';

class FlightsPage extends StatelessWidget {
  const FlightsPage({Key? key}) : super(key: key);
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter list",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter list"),
          ),
          body: FutureBuilder(
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.none &&
                  projectSnap.hasData == false) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              if (projectSnap.connectionState == ConnectionState.done) {
                final flight = projectSnap.data as List<Flight?>;
                return ListView.builder(
                    itemCount: flight.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading:
                                  Icon(TravelApp.plane_departure, size: 50),
                              title: Text(flight[i]?.number ?? "canceled"),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });
              }
              return Container();
            },
            future: FlightRepository().getFlights(),
          )),
    );
  }

  List<String> generateValue() {
    return ["ds", "dsds", "dsds"];
  }
}
