import 'package:pigeon/pigeon.dart';

class Flight {
  String? number;
  String? origin;
  String? destination;
  double? duration;
  int? price;
}

@HostApi()
abstract class FlightApi {
  List<Flight> fetchAll();
}