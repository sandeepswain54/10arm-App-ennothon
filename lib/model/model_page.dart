class Batch {
  String id;
  String transitStatus;
  DateTime expiryDate;
  String storageConditions;
  double temperature;
  double humidity;
  bool isActive;
  List<Map<String, dynamic>> history; // Stores lifecycle history

  Batch({
    required this.id,
    required this.transitStatus,
    required this.expiryDate,
    required this.storageConditions,
    required this.temperature,
    required this.humidity,
    this.isActive = true,
    this.history = const [],
  });

  void addHistoryEntry(String event, String details) {
    history.add({
      'timestamp': DateTime.now(),
      'event': event,
      'details': details,
    });
  }
}