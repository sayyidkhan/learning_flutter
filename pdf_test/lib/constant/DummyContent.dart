import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;
import 'package:flutter/material.dart' as fm;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../widget/pdf/InvoicePageWidget.dart';

class Content2 {

  static Future<ByteData> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

//    final file = io.File('${(await getTemporaryDirectory()).path}/$path');
    final file = io.File('$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return byteData;
  }

  static void pdfVersion1(widgets.Document pdf){
    pdf.addPage(
        widgets.MultiPage(
          pageFormat: PdfPageFormat.a5,
          margin: widgets.EdgeInsets.all(32),

          build: (widgets.Context context){
            return <widgets.Widget>  [
              widgets.Header(
                  level: 0,
                  child: widgets.Text("Easy Approach Document")
              ),
              widgets.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
              widgets.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
              widgets.Header(
                  level: 1,
                  child: widgets.Text("Second Heading")
              ),
              widgets.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
              widgets.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
              widgets.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
            ];
          },

        )
    );
  }

  static void pdfVersion2(widgets.Document pdf) async {
    
    //load images
//    final ByteData bytes = await rootBundle.load("image/test_header.jpg");
//    final headerImage = PdfImage.file(
//      pdf.document,
//      bytes: bytes.buffer.asUint8List(),
//    );
    
    //load fonts
    final ralewayRegular = widgets.Font.ttf(await rootBundle.load("fonts/Raleway/Raleway-Regular.ttf"));
    final ralewayBold =  widgets.Font.ttf(await rootBundle.load("fonts/Raleway/Raleway-Bold.ttf"));
    
    //pdf constraints
    const twoCm = 2.0 * PdfPageFormat.cm;

    pdf.addPage(
      InvoicePage(
        //manage the position of the header from this page
        margin: widgets.EdgeInsets.fromLTRB(twoCm, 7.0 * PdfPageFormat.cm, twoCm, twoCm),
//        headerImage: headerImage,
        build: (context) => widgets.Column(
          children: <widgets.Widget>[
            widgets.Text(
              "Invoice",
              style: widgets.TextStyle(
                font: ralewayBold,
                fontSize: 36.0,
              ),
            ),
            widgets.Text(
              "No. 01/12/2019",
              style: widgets.TextStyle(
                font: ralewayRegular,
                fontSize: 24.0,
              ),
            ),
            widgets.Text(
              "Date of issue: 01.12.2019",
              style: widgets.TextStyle(font: ralewayRegular),
            ),
            widgets.Text(
              "Date of service: 01.12.2019",
              style: widgets.TextStyle(font: ralewayRegular),
            ),
            widgets.Text(
              "Place of issue: Przemysl",
              style: widgets.TextStyle(font: ralewayRegular),
            ),
            widgets.SizedBox(height: 2.0 * PdfPageFormat.cm),
            widgets.Row(
              mainAxisAlignment: widgets.MainAxisAlignment.spaceBetween,
              children: <widgets.Widget>[
                widgets.Column(
                    crossAxisAlignment: widgets.CrossAxisAlignment.start,
                    children: <widgets.Widget>[
                      widgets.Text(
                        "Fantasy company Ltd.",
                        style: widgets.TextStyle(font: ralewayBold),
                      ),
                      widgets.Text(
                        "123 Ocean Drive",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "90-315 Los Angeles, California",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "United States of America",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "Tax ID: 123141434",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                    ]),
                widgets.Column(
                    crossAxisAlignment: widgets.CrossAxisAlignment.start,
                    children: <widgets.Widget>[
                      widgets.Text(
                        "otherland labs sp. z o.o.",
                        style: widgets.TextStyle(font: ralewayBold),
                      ),
                      widgets.Text(
                        "Joze korzeniowkiego 11/4",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "37-700 Przemyl",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "Poland",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                      widgets.Text(
                        "Tax ID: 123141434",
                        style: widgets.TextStyle(font: ralewayRegular),
                      ),
                    ]),
              ],
            ),
            widgets.SizedBox(height: 2.0 * PdfPageFormat.cm),
            widgets.Table.fromTextArray(
                context: context,
                data: [
                  ["No","Service","Net Price","VAT Rate","Total Gross"],
                  ["1","Flutter Development","\$1000","-","\$1000"],
                  ["2","Gatsby Development","\$500","-","\$500"],
                ]
            ),
            widgets.SizedBox(height: 1.0 * PdfPageFormat.cm),
            widgets.Row(
                children: <widgets.Widget>[
                  widgets.Expanded(child: widgets.Container()),
                  widgets.Text("To pay: \$1500",
                      style: widgets.TextStyle(font: ralewayBold,fontSize: 18.0)
                  ),
                ]
            ),
            widgets.SizedBox(height: 3.0 * PdfPageFormat.cm),
            widgets.Row(
                mainAxisAlignment: widgets.MainAxisAlignment.spaceBetween,
                children: <widgets.Widget> [
                  widgets.Column(
                    children: <widgets.Widget> [
                      widgets.Container(
                        width: 4.0 * PdfPageFormat.cm,
                        decoration: widgets.BoxDecoration(border: widgets.BoxBorder(top: true)),
                      ),
                      widgets.Text("Buyer",
                          style: widgets.TextStyle(font: ralewayRegular)
                      ),
                    ],
                  ),
                  widgets.Column(
                    children: <widgets.Widget> [
                      widgets.Container(
                        width: 4.0 * PdfPageFormat.cm,
                        decoration: widgets.BoxDecoration(border: widgets.BoxBorder(top: true)),
                      ),
                      widgets.Text("Seller",
                          style: widgets.TextStyle(font: ralewayRegular)
                      ),
                    ],
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }

}