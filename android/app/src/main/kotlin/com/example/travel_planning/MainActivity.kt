package com.example.travel_planning

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Pidgeon.FlightApi.setup(flutterEngine.dartExecutor.binaryMessenger, FlightApiImpl())
    }
}
