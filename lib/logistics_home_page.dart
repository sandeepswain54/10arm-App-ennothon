import 'package:flutter/material.dart';
import 'package:newbhu/logistics_deliveries_page.dart';

class LogisticsHomePage extends StatefulWidget {
  const LogisticsHomePage({Key? key}) : super(key: key);

  @override
  State<LogisticsHomePage> createState() => _LogisticsHomePageState();
}

class _LogisticsHomePageState extends State<LogisticsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    const Text(
                      "Afternoon",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 340,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 24,
                      right: 16,
                      top: 24,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Delivery TEAM\nTHAT CARES\nABOUT YOU",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "Logistics",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            height: 4,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Container(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Container(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Container(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  // SEND SHIPMENT Card with Navigation
                  GestureDetector(
                    onTap: () {
                      // Navigate to the SendShipmentPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogisticsDeliveriesPage()),
                      );
                    },
                    child: _buildFeatureCard(
                      icon: Icons.rocket_launch,
                      title: "SEND\nSHIPMENT",
                      color: const Color(0xFFFF6F61),
                    ),
                  ),
                  // FEES & PRICES Card with Navigation
                  GestureDetector(
                    onTap: () {
                      // Navigate to the FeesAndPricesPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeesAndPricesPage()),
                      );
                    },
                    child: _buildFeatureCard(
                      icon: Icons.save,
                      title: "FEES\n&PRICES",
                      color: const Color(0xFF6B5B95),
                    ),
                  ),
                  // HELP CENTER Card with Navigation
                  GestureDetector(
                    onTap: () {
                      // Navigate to the HelpCenterPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HelpCenterPage()),
                      );
                    },
                    child: _buildFeatureCard(
                      icon: Icons.biotech,
                      title: "HELP\nCENTER",
                      color: const Color(0xFF88B04B),
                    ),
                  ),
                  // SERVICE POINTS Card with Navigation
                  GestureDetector(
                    onTap: () {
                      // Navigate to the ServicePointsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServicePointsPage()),
                      );
                    },
                    child: _buildFeatureCard(
                      icon: Icons.flight_takeoff,
                      title: "SERVICE\nPOINTS",
                      color: const Color(0xFFF7CAC9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 12,
            top: 12,
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New Page for Fees & Prices
class FeesAndPricesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fees & Prices'),
      ),
      body: const Center(
        child: Text(
          'This is the Fees & Prices Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// New Page for Help Center
class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: const Center(
        child: Text(
          'This is the Help Center Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// New Page for Service Points
class ServicePointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Points'),
      ),
      body: const Center(
        child: Text(
          'This is the Service Points Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}