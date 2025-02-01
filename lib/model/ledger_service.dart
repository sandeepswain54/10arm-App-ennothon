class LedgerService {
  static final List<Map<String, dynamic>> _ledger = [];

  static void addEntry(String batchId, String event, String details) {
    _ledger.add({
      'batchId': batchId,
      'timestamp': DateTime.now(),
      'event': event,
      'details': details,
    });
  }

  static List<Map<String, dynamic>> getEntries(String batchId) {
    return _ledger.where((entry) => entry['batchId'] == batchId).toList();
  }
}