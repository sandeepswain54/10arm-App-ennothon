import 'package:newbhu/model/model_page.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ReportService {
  static Future<File> generatePdf(Batch batch) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Header(level: 0, child: pw.Text('Batch Report')),
              pw.Text('Batch ID: ${batch.id}'),
              pw.Text('Transit Status: ${batch.transitStatus}'),
              pw.Text('Expiry Date: ${batch.expiryDate.toLocal().toString().split(' ')[0]}'),
              pw.Text('Storage Conditions: ${batch.storageConditions}'),
              pw.SizedBox(height: 20),
              pw.Header(level: 1, child: pw.Text('History')),
              for (var entry in batch.history)
                pw.Text('${entry['timestamp']}: ${entry['event']} - ${entry['details']}'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/batch_report.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}