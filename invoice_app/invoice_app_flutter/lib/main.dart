import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'file:///Users/sayyidiskandarkhan/github_projects/pdf_test/lib/InvoicePage.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

void main() {
  final Document pdf = Document();
  final headerPng = decodeImage(File("../image/test_header.jpg").readAsBytesSync());
  final headerImage = PdfImage(
    pdf.document,
    image: headerPng.data.buffer.asUint8List(),
    width: headerPng.width,
    height: headerPng.height,
  );

  final Uint8List ralewayRegularData =
      File("../fonts/Raleway/Raleway-Regular.ttf").readAsBytesSync();
  final ralewayRegular = Font.ttf(ralewayRegularData.buffer.asByteData());

  final Uint8List ralewayBoldData =
      File("../fonts/Raleway/Raleway-Bold.ttf").readAsBytesSync();
  final ralewayBold = Font.ttf(ralewayBoldData.buffer.asByteData());

  const twoCm = 2.0 * PdfPageFormat.cm;

  pdf.addPage(
    InvoicePage(
      margin: EdgeInsets.fromLTRB(twoCm, 7.0 * PdfPageFormat.cm, twoCm, twoCm),
      headerImage: headerImage,
      build: (context) => Column(
        children: <Widget>[
          Text(
            "Invoice",
            style: TextStyle(
              font: ralewayBold,
              fontSize: 36.0,
            ),
          ),
          Text(
            "No. 01/12/2019",
            style: TextStyle(
              font: ralewayBold,
              fontSize: 24.0,
            ),
          ),
          Text(
            "Date of issue: 01.12.2019",
            style: TextStyle(font: ralewayRegular),
          ),
          Text(
            "Date of service: 01.12.2019",
            style: TextStyle(font: ralewayRegular),
          ),
          Text(
            "Place of issue: Przemysl",
            style: TextStyle(font: ralewayRegular),
          ),
          SizedBox(height: 2.0 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  "Fantasy company Ltd.",
                  style: TextStyle(font: ralewayBold),
                ),
                Text(
                  "123 Ocean Drive",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "90-315 Los Angeles, California",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "United States of America",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "Tax ID: 123141434",
                  style: TextStyle(font: ralewayRegular),
                ),
              ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  "otherland labs sp. z o.o.",
                  style: TextStyle(font: ralewayBold),
                ),
                Text(
                  "Joze korzeniowkiego 11/4",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "37-700 Przemyl",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "Poland",
                  style: TextStyle(font: ralewayRegular),
                ),
                Text(
                  "Tax ID: 123141434",
                  style: TextStyle(font: ralewayRegular),
                ),
              ]),
            ],
          ),
          SizedBox(height: 2.0 * PdfPageFormat.cm),
          Table.fromTextArray(
              context: context,
              data: [
                ["No","Service","Net Price","VAT Rate","Total Gross"],
                ["1","Flutter Development","\$1000","-","\$1000"],
                ["2","Gatsby Development","\$500","-","\$500"],
              ]
          ),
          SizedBox(height: 1.0 * PdfPageFormat.cm),
          Row(
            children: <Widget>[
              Expanded(child: Container()),
              Text("To pay: \$1500", style: TextStyle(font: ralewayBold,fontSize: 18.0)),
            ]
          ),
          SizedBox(height: 3.0 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Column(
                children: <Widget> [
                  Container(
                  width: 4.0 * PdfPageFormat.cm,
                  decoration: BoxDecoration(border: BoxBorder(top: true)),
                  ),
                  Text("Buyer", style: TextStyle(font: ralewayRegular)),
                ],
              ),
              Column(
                children: <Widget> [
                  Container(
                    width: 4.0 * PdfPageFormat.cm,
                    decoration: BoxDecoration(border: BoxBorder(top: true)),
                  ),
                  Text("Seller", style: TextStyle(font: ralewayRegular)),
                ],
              )
            ]
          ),
        ],
      ),
    ),
  );

  final File file = File("../pdf_output/example.pdf");
  file.writeAsBytesSync(pdf.save());
}
