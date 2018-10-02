import 'package:flutter/material.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/widget/home_card_item.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final GlobalKey<AnimatedListState> _listKey1 = GlobalKey();
  final GlobalKey<AnimatedListState> _listKey2 = GlobalKey();
  final GlobalKey<AnimatedListState> _listKey3 = GlobalKey();

  _buildAnimatedList(GlobalKey<AnimatedListState> _key){
    return Container(
      constraints: const BoxConstraints(maxHeight: 120.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedList(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10.0, bottom: 20.0, right: 10.0, top: 10.0),
          scrollDirection: Axis.horizontal,
          key: _key,
          initialItemCount: 4,
          itemBuilder: (context, index, animation){
            return FadeTransition(
              opacity: animation,
              child: HomeCardItem("Item\nName", () {}, Colors.red, new AssetImage("assets/images/featured_meal.jpg")),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: kToolbarHeight),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenSize.width > screenSize.height
                  ? (screenSize.height - kToolbarHeight) * 0.55
                  : (screenSize.height - kToolbarHeight) * 0.35,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/images/featured_meal.jpg',
                    fit: BoxFit.cover,
                    //height: 200.0,
                  ),
                  Container(
                    color: Colors.black12.withOpacity(0.2),
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Text('Pizza\nQuatro Estações', style: RapidinhoTextStyle.displayText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: _buildAnimatedList(_listKey1),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: _buildAnimatedList(_listKey2),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: _buildAnimatedList(_listKey3),
            ),
          ),
        ],
      ),
    );
  }
}
