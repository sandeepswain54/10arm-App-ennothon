import 'package:sensors_plus/sensors_plus.dart';

class SensorData {
  // Simulate temperature and humidity data
  double temperature = 0.0;
  double humidity = 0.0;

  // Listen to sensor data (simulated using accelerometerEvents)
  void startListening(void Function(double, double) onDataUpdate) {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Simulate temperature and humidity data
      temperature = event.x.abs(); // Use absolute value for simulation
      humidity = event.y.abs(); // Use absolute value for simulation
      onDataUpdate(temperature, humidity);
    });
  }
}