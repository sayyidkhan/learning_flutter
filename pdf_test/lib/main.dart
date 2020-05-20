import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_test/screen/FormScreen.dart';
import 'package:pdf_test/widget/ui/InvoiceOverviewWidget.dart';


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
        routes: {
        FormScreen.routeName : (ctx) => FormScreen(),
        },
    );
  }
}

class MyHomePage extends StatelessWidget {

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
          onPressed: () {
            Navigator.pushNamed(context,  FormScreen.routeName );
          }
        ),
      ),
    );
  }

}
