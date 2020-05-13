import 'dart:io';

import 'package:flutter/material.dart' as mw;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class InvoiceRepository {
  InvoiceRepository();

  Future<void> share() async {
//    return Printing.sharePdf(
//      bytes: await _generatePDF(),
//      filename: "pdf_output/invoice.pdf"
//    );
      _generatePDF();
      return null;
  }

  Future<List<int>> _generatePDF() async {
    final Document pdf = Document();

    pdf.addPage(Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return Center(
            child: Text("Hello World", style: TextStyle(fontSize: 40)),
          ); // Center
        }));


    final File file = File("example.pdf");
    file.writeAsBytesSync(pdf.save());
  }
}

class InvoicePage extends Page {
  final PdfImage headerImage;

  InvoicePage({
    this.headerImage,
    BuildCallback build,
    EdgeInsets margin,
  }) : super(
          build: build,
          margin: margin,
          pageFormat: PdfPageFormat.a4,
          orientation: PageOrientation.portrait,
        );

  @override
  void paint(Widget child, Context context) {
    if (headerImage != null) {
      final imgProportions = headerImage.width / headerImage.height;
      context.canvas.drawImage(
          headerImage,
          0,
          PdfPageFormat.a4.height - (headerImage.height / imgProportions),
          PdfPageFormat.a4.width);
    }
    super.paint(child, context);
  }
}
