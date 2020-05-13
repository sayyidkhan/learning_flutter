import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatelessWidget {
  final Uint8List pdfFile;
  final String path;

  PdfPreviewScreen({this.pdfFile,this.path});

  Future printPdf(Uint8List pdf) async {
    await Printing.sharePdf(bytes: pdf, filename: 'my-document.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
          title: Text("PDF Preview"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.file_download),
              tooltip: 'download file',
              onPressed: () {
                printPdf(pdfFile);
                print("download");
              },
            ),
          ],
      ),
      path: path,
    );
  }
}
