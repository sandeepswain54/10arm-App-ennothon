import 'package:flutter/material.dart';
import 'package:newbhu/model/batchdetails.dart'; // Adjust the import path as needed
import 'package:newbhu/model/model_page.dart';
 // Adjust the import path as needed

class BatchListScreen extends StatefulWidget {
  @override
  _BatchListScreenState createState() => _BatchListScreenState();
}

class _BatchListScreenState extends State<BatchListScreen> {
  List<Batch> batches = [];

  void _addOrUpdateBatch(Batch? batch) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BatchDetailScreen(
          batch: batch ?? Batch( // Provide a default Batch if batch is null
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            transitStatus: 'In Transit',
            expiryDate: DateTime.now().add(Duration(days: 30)),
            storageConditions: 'Cool and Dry',
            temperature: 20.0,
            humidity: 50.0,
          ),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        if (batch != null) {
          // Update existing batch
          final index = batches.indexWhere((b) => b.id == batch.id);
          batches[index] = result;
        } else {
          // Add new batch
          batches.add(result);
        }
      });
    }
  }

  void _deleteBatch(String id) {
    setState(() {
      batches.removeWhere((batch) => batch.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Batch Management'),
      ),
      body: ListView.builder(
        itemCount: batches.length,
        itemBuilder: (context, index) {
          final batch = batches[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('Batch ID: ${batch.id}'),
              subtitle: Text(
                'Status: ${batch.transitStatus}\nExpiry: ${batch.expiryDate.toLocal().toString().split(' ')[0]}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _addOrUpdateBatch(batch),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteBatch(batch.id),
                  ),
                ],
              ),
              onTap: () => _addOrUpdateBatch(batch),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrUpdateBatch(null),
        child: Icon(Icons.add),
      ),
    );
  }
}