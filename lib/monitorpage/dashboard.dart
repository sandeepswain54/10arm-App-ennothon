import 'package:flutter/material.dart';
import 'dart:async'; // Import Timer

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double _temperature = 20.0; // Initial temperature
  double _humidity = 50.0; // Initial humidity
  Timer? _timer; // Timer to simulate dynamic data

  // Example data for recent transports
  final List<Map<String, String>> recentTransports = [
    {'id': 'TR123', 'date': '2023-10-01', 'status': 'Completed'},
    {'id': 'TR124', 'date': '2023-10-02', 'status': 'In Progress'},
    {'id': 'TR125', 'date': '2023-10-03', 'status': 'Pending'},
  ];

  @override
  void initState() {
    super.initState();
    // Start a timer to simulate dynamic temperature and humidity changes
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        // Simulate temperature change between 15°C and 25°C
        _temperature = 15 + (DateTime.now().second % 10).toDouble();

        // Simulate humidity change between 40% and 60%
        _humidity = 40 + (DateTime.now().second % 20).toDouble();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Function to simulate downloading a statement
  void _downloadStatement() {
    // Simulate generating and downloading a statement
    final statementData = '''
Transport ID,Date,Status
TR123,2023-10-01,Completed
TR124,2023-10-02,In Progress
TR125,2023-10-03,Pending
''';

    // Show a dialog to indicate the statement is ready
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download Statement'),
        content: Text('Your statement is ready to download.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Here you can add logic to save the statement as a file
              print('Statement Data:\n$statementData');
            },
            child: Text('Download'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Sensor Data'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Real-Time Sensor Data Section
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Real-Time Sensor Data',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Temperature:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${_temperature.toStringAsFixed(2)}°C',
                              style: TextStyle(fontSize: 24, color: Colors.blue),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Humidity:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              '${_humidity.toStringAsFixed(2)}%',
                              style: TextStyle(fontSize: 24, color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Recent Transport Section
            Text(
              'Recent Transports',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recentTransports.length,
              itemBuilder: (context, index) {
                final transport = recentTransports[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text('Transport ID: ${transport['id']}'),
                    subtitle: Text('Date: ${transport['date']} | Status: ${transport['status']}'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Add navigation or action for transport details
                      print('Selected Transport: ${transport['id']}');
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Download Statement Section
            Center(
              child: ElevatedButton(
                onPressed: _downloadStatement,
                child: Text('Download Statement'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}