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

    final FlightRepository repository = FlightRepository();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Flights"),
        ),
        body: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none ||
                projectSnap.hasData == false) {
              return Container();
            }
            if (projectSnap.connectionState == ConnectionState.done) {
              final flights = projectSnap.data as List<Flight?>;
              return ListView.builder(
                  itemCount: flights.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      child: Card(
                          child: Container(
                            padding: EdgeInsets.only(right: 15, top: 20, bottom: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(TravelApp.plane_departure, size: 50),
                                      SizedBox(width: 25),
                                      Container(width: 70, child: Text(flights[i]?.origin ?? "Invalid", overflow: TextOverflow.ellipsis))
                                    ]),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(flights[i]?.number ?? "Unknown", style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("${flights[i]?.duration} hours"),
                                    Text(flights[i]?.price ?? "Unknown")
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(alignment: AlignmentDirectional.centerEnd,width: 70, child: Text(flights[i]?.destination ?? "Invalid", overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width: 15),
                                      Icon(TravelApp.plane_arrival, size: 50)
                                    ]),
                              ])
                          )
                      ),
                      onTap: () {
                        String? flightNumber = flights[i]?.number;

                        if (flightNumber != null) {
                          repository.selectFlight(flightNumber);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Invalid flight")
                          ));
                        }
                      }
                    );
                  });
            }
            return Container();
          },
          future: repository.getFlights(),
        )
    );
  }

  List<String> generateValue() {
    return ["ds", "dsds", "dsds"];
  }
}
