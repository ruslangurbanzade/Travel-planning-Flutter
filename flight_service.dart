import 'package:pigeon/pigeon.dart';

class Flight {
  String? number;
  String? origin;
  String? destination;
  int? duration;
  String? price;
}

@HostApi()
abstract class FlightApi {
  List<Flight> fetchAll();
  void select(String number);
  String? fetchSelected();
}