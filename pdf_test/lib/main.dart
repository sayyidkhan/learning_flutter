import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_test/IOopertions/IoOperations.dart';
import 'package:pdf_test/constant/GeneratePdfContent.dart';
import 'package:pdf_test/screen/PdfPreviewScreen.dart';
import 'package:pdf_test/widget/ui/InvoiceOverviewWidget.dart';

import 'constant/DummyContent.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final pdf = pw.Document();

  void writeOnPdf() {
    Content2.pdfVersion2(pdf);
  }
  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    final content = pdf.save();
    file.writeAsBytesSync(content);

    return content;
  }

  Widget build(BuildContext context) {
    List<ListTile> listArray = new InvoiceOverviewWidget(context).listArray;

    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice Builder"),
      ),

      body:
      listArray.isEmpty ?
        InvoiceOverviewWidget.emptyList() :
        ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: listArray
          ).toList(),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'add new invoice',
          onPressed: () async {
            writeOnPdf();
            final content = await savePdf();
            Directory documentDirectory = await getApplicationDocumentsDirectory();
            String documentPath = documentDirectory.path;
            String fullPath = "$documentPath/example.pdf";

            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    PdfPreviewScreen(
                      pdfFile: content,
                      path: fullPath,
                    )
            ));
          },
        ),
      ),
    );
  }

}
