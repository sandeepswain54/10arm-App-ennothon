import 'package:flutter/material.dart';
import 'package:newbhu/view/widgets/seperator_widget.dart'; // Ensure this path is correct

class LogisticsDeliveriesPage extends StatefulWidget {
  const LogisticsDeliveriesPage({Key? key}) : super(key: key);

  @override
  State<LogisticsDeliveriesPage> createState() => _LogisticsDeliveriesPageState();
}

class _LogisticsDeliveriesPageState extends State<LogisticsDeliveriesPage> {
  bool _isToMeSelected = true; // Tracks whether "TO ME" is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deliveries'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Row(
                children: [
                  const Text(
                    "Deliveries",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.timer_outlined,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 42),
            // Toggle between "TO ME" and "FROM ME"
            Container(
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isToMeSelected = true; // Select "TO ME"
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isToMeSelected
                              ? const Color.fromRGBO(229, 248, 0, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "TO ME (6)",
                            style: TextStyle(
                              fontWeight: _isToMeSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isToMeSelected = false; // Select "FROM ME"
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !_isToMeSelected
                              ? const Color.fromRGBO(229, 248, 0, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "FROM ME (2)",
                            style: TextStyle(
                              fontWeight: !_isToMeSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Dynamic Content Based on Selection
            _isToMeSelected ? _buildToMeContent() : _buildFromMeContent(),
          ],
        ),
      ),
    );
  }

  // Content for "TO ME" Section
  Widget _buildToMeContent() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                const Text(
                  "ID:",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Text(
                  "94 2167 2200 0000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.location_pin,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("27 JAN 2023"),
                Text("28 JAN 2023"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Khurdha",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Sambalpur",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 12, 8.0, 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.black,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.black,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.black,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ON THE WAY To FACILITY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SeparatorWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text("DELIVERY COST"),
                      SizedBox(height: 6),
                      Text(
                        "\$10.99",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text("ITEMS #"),
                      SizedBox(height: 6),
                      Text(
                        "5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text("WEIGHT"),
                      SizedBox(height: 6),
                      Text(
                        "30.8 lbs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SeparatorWidget(),
          ),
        ],
      ),
    );
  }

  // Content for "FROM ME" Section
  Widget _buildFromMeContent() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Text(
                  "ID:",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "94 2167 2200 0001",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.location_pin,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("28 JAN 2023"),
                Text("29 JAN 2023"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Puri",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Bhubaneswar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ON THE WAY To DESTINATION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}