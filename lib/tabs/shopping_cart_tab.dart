import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() => _ShoppingCartTabState();
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Conta', style: RapidinhoTextStyle.displayText));
  }
}