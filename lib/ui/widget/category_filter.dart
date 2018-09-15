import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class CategoryFilter extends AnimatedWidget {

  CategoryFilter({
    Key key,
    Animation<double> expandAnimation,
  }) : super(key: key, listenable: expandAnimation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: animation.value,
      child: Material(
        color: Colors.transparent,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ALL', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('TODAY', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('RECOMMENDED', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ALLOWED', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('POPULAR', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('NEW', style: RapidinhoTextStyle.filterCategoryText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ALTERED', style: RapidinhoTextStyle.filterCategoryText),
            ),
          ],
        ),
      ),
    );
  }
}
