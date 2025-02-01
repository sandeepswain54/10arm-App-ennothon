import 'package:flutter/material.dart';

class FeesAndPricesPage extends StatelessWidget {
  // Example data for fees and prices
  final List<Map<String, String>> feesAndPrices = [
    {
      'service': 'Standard Delivery',
      'price': '\$10.99',
      'description': 'Delivery within 3-5 business days',
    },
    {
      'service': 'Express Delivery',
      'price': '\$19.99',
      'description': 'Delivery within 1-2 business days',
    },
    {
      'service': 'Overnight Delivery',
      'price': '\$29.99',
      'description': 'Delivery by the next business day',
    },
    {
      'service': 'International Delivery',
      'price': '\$49.99',
      'description': 'Delivery to international destinations',
    },
    {
      'service': 'Heavy Item Surcharge',
      'price': '\$15.00',
      'description': 'Additional fee for items over 50 lbs',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fees & Prices'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: feesAndPrices.length,
        itemBuilder: (context, index) {
          final item = feesAndPrices[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['service']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['price']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['description']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}