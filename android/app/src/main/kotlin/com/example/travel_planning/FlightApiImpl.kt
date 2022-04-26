package com.example.travel_planning

class FlightApiImpl : Pidgeon.FlightApi {

    private val flightList: List<Pidgeon.Flight> = listOf(
        newFlight("LT1234", "Berlin", "Amsterdam", 3, "$300,00"),
        newFlight("LT2345", "Prague", "Paris", 2, "$250,00"),
        newFlight("LT5443", "Madrid", "Amsterdam", 1, "$120,00"),
        newFlight("LT8765", "Paris", "Madrid", 4, "$300,00"),
        newFlight("LT2346", "Lisbon", "Prague", 2, "$350,00"),
        newFlight("LT7762", "Madrid", "Lisbon", 5, "$120,00"),
        newFlight("LT2465", "Berlin", "Paris", 2, "$500,00"),
        newFlight("LT1345", "Prague", "Amsterdam", 5, "$450,00"),
    )

    private var selectedFlight: String? = null

    override fun fetchAll(): List<Pidgeon.Flight> {
        return flightList
    }

    override fun select(number: String) {
        selectedFlight = number
    }

    override fun fetchSelected(): String? {
        return selectedFlight
    }

    private fun newFlight(
        number: String,
        origin: String?,
        destination: String?,
        duration: Long?,
        price: String?
    ): Pidgeon.Flight {
        val builder = Pidgeon.Flight.Builder()
        builder
            .setNumber(number)
            .setOrigin(origin)
            .setDestination(destination)
            .setDuration(duration)
            .setPrice(price)
        return builder.build()
    }
}