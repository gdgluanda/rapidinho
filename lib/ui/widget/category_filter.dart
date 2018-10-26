import 'package:flutter/material.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class CategoryFilterList extends StatelessWidget {
  final Function(FilterItem i) onFilterChanged;
  final List<FilterItem> filterList;

  CategoryFilterList({this.onFilterChanged, this.filterList});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filterList.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              onFilterChanged(filterList[index]);
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
    );
  }
}
