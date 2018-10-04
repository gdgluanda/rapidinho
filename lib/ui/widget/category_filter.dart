import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';

class CategoryFilterList extends StatefulWidget {

  final Function(int i) filter;


  CategoryFilterList({this.filter});

  @override
  _CategoryFilterListState createState() => _CategoryFilterListState();
}

class _CategoryFilterListState extends State<CategoryFilterList> {
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
              widget.filter(index);
              setState(() {
                filterList[index].isFilter = !filterList[index].isFilter;
              });
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
