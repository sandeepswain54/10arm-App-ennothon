import 'package:flutter/material.dart';
import 'package:newbhu/dashboard/dash.dart';
import 'package:newbhu/logistics_deliveries_page.dart';
import 'package:newbhu/logistics_home_page.dart';
import 'package:newbhu/model/batch_list.dart';
import 'package:newbhu/monitorpage/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages to navigate to
  final List<Widget> _pages = [
    DashboardPage(),
    LogisticsHomePage(),
    DashboardScreen(),
   BatchListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Logo Image
            Image.asset(
              'assets/o.png', // Path to your logo image
              height: 40, // Adjust the height as needed
              width: 40, // Adjust the width as needed
            ),
            const SizedBox(width: 10), // Add spacing between logo and title
            const Text(
              'Logic Lynk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true, // Center the title and logo
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Regulate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Trace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: 'Link',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
