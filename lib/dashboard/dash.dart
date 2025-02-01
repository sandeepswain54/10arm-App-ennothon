import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // AppBar color
        elevation: 10, // Shadow for AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Batch Monitoring Title
              const Text(
                'Batch Monitoring',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),

              // Batch Details Card
              Card(
                elevation: 8, // Add shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Batch Transit Status
                      _buildDetailRow(
                        'Batch Transit Status',
                        'M - W',
                        Icons.directions_bus,
                      ),
                      const SizedBox(height: 12),

                      // Creation Date
                      _buildDetailRow(
                        'Creation Date',
                        '2023-10-01',
                        Icons.calendar_today,
                      ),
                      const SizedBox(height: 12),

                      // Lifetime
                      _buildDetailRow(
                        'Lifetime',
                        '30 days',
                        Icons.timer,
                      ),
                      const SizedBox(height: 12),

                      // Temperature Range
                      _buildDetailRow(
                        'Temperature Range',
                        '20°C - 25°C (M)',
                        Icons.thermostat,
                      ),
                      const SizedBox(height: 12),

                      // Humidity Range
                      _buildDetailRow(
                        'Humidity Range',
                        '50% - 70% (M)',
                        Icons.water_drop,
                      ),
                      const SizedBox(height: 12),

                      // Environment Type
                      _buildDetailRow(
                        'Environment Type',
                        'Refrigerated',
                        Icons.ac_unit,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Trusted Industry Members Section
              const Text(
                'See What Our Clients Say about Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              _buildTrustedMembersSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a detail row with icons
  Widget _buildDetailRow(String label, String value, IconData icon) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.deepPurple,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16), // Add spacing between label and value
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple.shade700,
            ),
          ),
        ],
      ),
    );
  }

  // Trusted Industry Members Section
  Widget _buildTrustedMembersSection() {
    // List of trusted members
    final List<Map<String, dynamic>> trustedMembers = [
      {
        'name': 'Ravi Panda',
        'image': 'assets/s45.jpeg', // Path to image
        'experience': 'It helps is cost management',
      },
      {
        'name': 'Aryan Khan',
        'image': 'assets/s54.jpg', // Path to image
        'experience': 'it provides best optimization',
      },
      {
        'name': 'sandeep swain',
        'image': 'assets/mypics.jpg', // Path to image
        'experience': 'it makes the process easy',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: trustedMembers.length,
      itemBuilder: (context, index) {
        final member = trustedMembers[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Member Image
                CircleAvatar(
                  backgroundImage: AssetImage(member['image']),
                  radius: 30,
                ),
                const SizedBox(width: 16),
                // Member Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member['experience'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
    theme: ThemeData(
      fontFamily: 'Poppins', // Use a modern font (add it to pubspec.yaml)
    ),
  ));
}
