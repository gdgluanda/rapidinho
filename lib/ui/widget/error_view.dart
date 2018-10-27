import 'package:flutter/material.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class ErrorView extends StatelessWidget {

  final VoidCallback onRetry;

  ErrorView({this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Sem Internet', style: RapidinhoTextStyle.largeText),
        OutlineButton(
          onPressed: onRetry,
          child: Text('Tentar Novamente', style: RapidinhoTextStyle.normalText),
        )
      ],
    );
  }
}