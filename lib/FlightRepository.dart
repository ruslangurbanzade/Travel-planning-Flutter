import 'package:travel_planning/pigeon.dart';

class FlightRepository {
  final FlightApi flightApi;

  static final FlightRepository _repository =
      FlightRepository._internal(FlightApi());

  factory FlightRepository() {
    return _repository;
  }

  FlightRepository._internal(this.flightApi);

  Future<List<Flight?>> getFlights() => flightApi.fetchAll();
  Future<void> selectFlight(String number) => flightApi.select(number);
  Future<String?> getSelectedFlightNumber() => flightApi.fetchSelected();
}
