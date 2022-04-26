import 'package:travel_planning/pigeon.dart';

class FlightRepository {
  final FlightApi flightApi;

  FlightRepository({required this.flightApi});

  Future<List<Flight?>> getFlights() => flightApi.fetchAll();
}