import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class CategoryFilter extends AnimatedWidget {

  final Function(int i) filter;

  CategoryFilter({
    Key key,
    Animation<double> expandAnimation,
    this.filter,
  }) : super(key: key, listenable: expandAnimation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: animation.value,
      child: Material(
        color: Colors.transparent,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filterList.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                filter(index);
              },
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(minWidth: 100.0),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: filterList[index].isFilter ? Colors.white : Colors.red,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0), right: Radius.circular(20.0)),
                ),
                child: Text(
                  filterList[index].name,
                  style: RapidinhoTextStyle.filterCategoryText.copyWith(color: filterList[index].isFilter ? Colors.red : Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}
