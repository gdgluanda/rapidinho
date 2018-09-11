import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 55.0),
      child: ListView(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: PhysicalModel(
                  color: Colors.transparent,
                  borderRadius:
                      new BorderRadius.vertical(bottom: new Radius.elliptical(100.0, 20.0)),
                  child: new Image.asset(
                    'assets/images/featured_meal.jpg',
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Positioned(
                bottom: -15.0,
                width: MediaQuery.of(context).size.width,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: new BorderRadius.all(Radius.circular(50.0)),
                    shadowColor: Colors.black,
                    elevation: 10.0,
                    child: Card(
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Pesquise aqui",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
