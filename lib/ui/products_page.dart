import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:side_header_list_view/side_header_list_view.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideHeaderListView(
        itemCount: MockData.products.length,
        itemExtend: 100.0,
        itemBuilder: (context, index){
          return Card(
            child: Container(
              height: 50.0,
              width: 100.0,
              color: Colors.teal,
            ),
          );
        },
        headerBuilder: (context, index){
          return Text(
            MockData.products[index].name,
            style: RapidinhoTextStyle.mediumText,
          );
        },
        hasSameHeader: (a, b){
          return MockData.products[a].name == MockData.products[b].name;
        },
      ),
    );
  }
}