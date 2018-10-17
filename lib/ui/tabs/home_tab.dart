import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/home_card.dart';
import 'package:rapidinho/model/list_model.dart';
import 'package:rapidinho/model/navigation_tabs.dart';
import 'package:rapidinho/ui/container/active_filters.dart';
import 'package:rapidinho/ui/container/active_tab.dart';
import 'package:rapidinho/ui/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/widget/home_card_item.dart';

class HomeTab extends StatefulWidget {

  HomeTab();

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {

  final GlobalKey<AnimatedListState> _listKey1 = GlobalKey();
  final GlobalKey<AnimatedListState> _listKey2 = GlobalKey();
  final GlobalKey<AnimatedListState> _listKey3 = GlobalKey();
  AnimationController featuredImageAnimationController;
  Animation<double> featuredImageAnimation;
  ValueNotifier<int> currentTab;
  ListModel _list;
  Function contains = DeepCollectionEquality.unordered().equals;

  @override
  void initState() {
    super.initState();
    featuredImageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    featuredImageAnimation = Tween<double>(begin: -200.0, end: 0.0).animate(
        CurvedAnimation(parent: featuredImageAnimationController, curve: Curves.easeInOut),
    );
    featuredImageAnimationController.forward();
    currentTab = ValueNotifier(0);
    currentTab.addListener((){
      featuredImageAnimationController.reverse();
    });
  }

  @override
  void dispose() {
    featuredImageAnimationController.dispose();
    super.dispose();
  }

  _buildFeaturedImage(Size screenSize){
    return SliverToBoxAdapter(
      child: SizedBox(
        height: screenSize.width > screenSize.height
            ? (screenSize.height - kToolbarHeight) * 0.55
            : (screenSize.height - kToolbarHeight) * 0.35,
        child:
        AnimatedBuilder(
          animation: featuredImageAnimationController,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/home_items/home_item14.jpg',
                fit: BoxFit.cover,
                //height: 200.0,
              ),
              Container(
                color: Colors.black12.withOpacity(0.2),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Text('Acaba De\nMe Matar', style: RapidinhoTextStyle.displayText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          builder: (context, child) => new Transform.translate(
            offset: Offset(0.0, featuredImageAnimation.value),
            child: child,
          ),
        ),
      ),
    );
  }
  _buildAnimatedList(GlobalKey<AnimatedListState> _key, List<HomeCard> list){
    _list = ListModel(_key, list);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150.0,
        child: ActiveFilters(
          builder: (context, vm){
            print('Active Filters: ${vm.activeFilters.length}');
            return Container(
              constraints: BoxConstraints(maxHeight: 120.0),
              margin: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: AnimatedList(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 10.0, bottom: 20.0, right: 10.0, top: 10.0),
                  scrollDirection: Axis.horizontal,
                  key: _key,
                  initialItemCount: list.length,
                  itemBuilder: (context, index, animation){
                    return HomeCardItem(list[index].name, () {}, AssetImage(list[index].assetPath), animation);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ActiveTab(
      builder: (context,NavigationTab activeTab){
        currentTab.value = activeTab.index;
        return Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: kToolbarHeight),
          child: CustomScrollView(
            slivers: <Widget>[
              _buildFeaturedImage(screenSize),
              _buildAnimatedList(_listKey1, homeCardItemList1),
              _buildAnimatedList(_listKey2, homeCardItemList2),
              _buildAnimatedList(_listKey3, homeCardItemList3),
            ],
          ),
        );
      },
    );
  }
}
