import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_test/PdfPreviewScreen.dart';

import 'constant/Content2.dart';

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
    Content2.pdfVersion1(pdf);
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
    writeOnPdf();

    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Flutter"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'download file',
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text("PDF TUTORIAL", style: TextStyle(fontSize: 34),)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
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
        child: Icon(Icons.image),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
