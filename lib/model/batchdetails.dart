import 'package:flutter/material.dart';
import 'package:newbhu/model/batchdetails.dart';
import 'package:newbhu/model/model_page.dart'; // Adjust the import path as needed

class BatchDetailScreen extends StatefulWidget {
  final Batch? batch; // Accept a nullable Batch

  BatchDetailScreen({this.batch}); // Constructor accepts nullable Batch

  @override
  _BatchDetailScreenState createState() => _BatchDetailScreenState();
}

class _BatchDetailScreenState extends State<BatchDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _id;
  late String _transitStatus;
  late DateTime _expiryDate;
  late String _storageConditions;
  late double _temperature;
  late double _humidity;

  @override
  void initState() {
    super.initState();
    if (widget.batch != null) {
      // Editing an existing batch
      _id = widget.batch!.id;
      _transitStatus = widget.batch!.transitStatus;
      _expiryDate = widget.batch!.expiryDate;
      _storageConditions = widget.batch!.storageConditions;
      _temperature = widget.batch!.temperature;
      _humidity = widget.batch!.humidity;
    } else {
      // Creating a new batch
      _id = DateTime.now().millisecondsSinceEpoch.toString();
      _transitStatus = 'In Transit';
      _expiryDate = DateTime.now().add(Duration(days: 30));
      _storageConditions = 'Cool and Dry';
      _temperature = 20.0;
      _humidity = 50.0;
    }
  }

  void _saveBatch() {
    if (_formKey.currentState!.validate()) {
      final batch = Batch(
        id: _id,
        transitStatus: _transitStatus,
        expiryDate: _expiryDate,
        storageConditions: _storageConditions,
        temperature: _temperature,
        humidity: _humidity,
      );
      Navigator.pop(context, batch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.batch == null ? 'Create Batch' : 'Edit Batch'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _transitStatus,
                decoration: InputDecoration(labelText: 'Transit Status'),
                onChanged: (value) => _transitStatus = value,
                validator: (value) =>
                    value!.isEmpty ? 'Transit status is required' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _storageConditions,
                decoration: InputDecoration(labelText: 'Storage Conditions'),
                onChanged: (value) => _storageConditions = value,
                validator: (value) =>
                    value!.isEmpty ? 'Storage conditions are required' : null,
              ),
              SizedBox(height: 16),
              Text('Expiry Date: ${_expiryDate.toLocal().toString().split(' ')[0]}'),
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _expiryDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _expiryDate = selectedDate;
                    });
                  }
                },
                child: Text('Select Expiry Date'),
              ),
              SizedBox(height: 16),
              Text('Temperature: ${_temperature.toStringAsFixed(2)}°C'),
              Slider(
                value: _temperature,
                min: 0,
                max: 40,
                onChanged: (value) {
                  setState(() {
                    _temperature = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Humidity: ${_humidity.toStringAsFixed(2)}%'),
              Slider(
                value: _humidity,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    _humidity = value;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveBatch,
                child: Text('Save Batch'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}