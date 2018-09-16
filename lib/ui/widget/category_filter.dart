import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class CategoryFilter extends AnimatedWidget {

  CategoryFilter({
    Key key,
    Animation<double> expandAnimation,
  }) : super(key: key, listenable: expandAnimation);

  List<String> filterCategoryNames = [
    'Todos',
    'Hoje',
    'Recomendado',
    'Permitido',
    'Popular',
    'Novos',
    'Adulterados',
  ];

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: animation.value,
      child: Material(
        color: Colors.transparent,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filterCategoryNames.map((name){
            return Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: 100.0),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0), right: Radius.circular(20.0)),
              ),
              child: Text(name, style: RapidinhoTextStyle.filterCategoryText.copyWith(color: Colors.red)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
