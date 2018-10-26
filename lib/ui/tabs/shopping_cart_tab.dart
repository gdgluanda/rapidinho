import 'package:flutter/material.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class ShoppingCartTab extends StatefulWidget {
  @override
  _ShoppingCartTabState createState() => _ShoppingCartTabState();
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {

  @override
  Widget build(BuildContext context) {
    return Column(
		  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/empty_cart_state.png', height: 200.0),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('Lista Vasia!', style: RapidinhoTextStyle.largeText),
            ),
            Text('Nada foi adicionado a lista de compras', style: RapidinhoTextStyle.normalText),
          ],
        );
  }
}