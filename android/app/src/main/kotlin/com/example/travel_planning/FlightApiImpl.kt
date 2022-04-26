package com.example.travel_planning

class FlightApiImpl : Pidgeon.FlightApi {

    private val flightList: List<Pidgeon.Flight> = listOf(
        Pidgeon.Flight(),
        Pidgeon.Flight(),
        Pidgeon.Flight(),
        Pidgeon.Flight(),
        Pidgeon.Flight()
    )

    override fun fetchAll(): List<Pidgeon.Flight> {
        return flightList
    }
}