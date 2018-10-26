import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/ui/product/products_view_model.dart';
import 'package:rapidinho/ui/widget/loading_view.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsViewModel>(
      distinct: true,
      converter: (store) => ProductsViewModel.fromStore(store),
      builder: (_, vm){
        return LoadingView(
          status: vm.status,
          loadingContent: Container(color: Colors.yellow),
          successContent: Container(color: Colors.green),
          errorContent: Container(color: Colors.red),
        );
      },
    );
  }
}

//class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
//
//  final GlobalKey<AnimatedListState> _listKey1 = GlobalKey();
//  final GlobalKey<AnimatedListState> _listKey2 = GlobalKey();
//  final GlobalKey<AnimatedListState> _listKey3 = GlobalKey();
//  AnimationController featuredImageAnimationController;
//  Animation<double> featuredImageAnimation;
//  ValueNotifier<int> currentTab;
//  ListModel _list;
//  Function contains = DeepCollectionEquality.unordered().equals;
//
//  @override
//  void initState() {
//    super.initState();
//    featuredImageAnimationController = AnimationController(
//      vsync: this,
//      duration: Duration(milliseconds: 500),
//    );
//    featuredImageAnimation = Tween<double>(begin: -200.0, end: 0.0).animate(
//        CurvedAnimation(parent: featuredImageAnimationController, curve: Curves.easeInOut),
//    );
//    featuredImageAnimationController.forward();
//    currentTab = ValueNotifier(0);
//    currentTab.addListener((){
//      featuredImageAnimationController.reverse();
//    });
//  }
//
//  @override
//  void dispose() {
//    featuredImageAnimationController.dispose();
//    super.dispose();
//  }
//
//  _buildFeaturedImage(Size screenSize){
//    return SliverToBoxAdapter(
//      child: SizedBox(
//        height: screenSize.width > screenSize.height
//            ? (screenSize.height - kToolbarHeight) * 0.55
//            : (screenSize.height - kToolbarHeight) * 0.45,
//        child: Stack(
//          children: <Widget>[
//            Container(
//              margin: EdgeInsets.only(bottom: 50.0),
//              child: AnimatedBuilder(
//                animation: featuredImageAnimationController,
//                child: Stack(
//                  fit: StackFit.expand,
//                  children: <Widget>[
//                    Image.asset(
//                      'assets/images/home_items/home_item14.jpg',
//                      fit: BoxFit.cover,
//                      //height: 200.0,
//                    ),
//                    Container(
//                      color: Colors.black.withOpacity(0.3),
//                      alignment: Alignment.topLeft,
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 35.0),
//                        child: new Text('Hamburger de\nQueijo e Beicon', style: RapidinhoTextStyle.displayText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
//                      ),
//                    ),
//                  ],
//                ),
//                builder: (context, child) => new Transform.translate(
//                  offset: Offset(0.0, featuredImageAnimation.value),
//                  child: child,
//                ),
//              ),
//            ),
//            AnimatedBuilder(
//              animation: featuredImageAnimationController,
//              child: Align(
//                alignment: Alignment.bottomCenter,
//                child: Container(
//                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                    color: Colors.white,
//                    shape: BoxShape.rectangle,
//                    borderRadius: BorderRadius.circular(50.0),
//                    boxShadow: <BoxShadow>[
//                      BoxShadow(color: Colors.black38,
//                          blurRadius: 2.0,
//                          spreadRadius: 1.0,
//                          offset: Offset(0.0, 1.0)),
//                    ],
//                  ),
//                  child: Padding(
//                    padding: EdgeInsets.only(left: 24.0),
//                    child: TextField(
//                      style: RapidinhoTextStyle.mediumText,
//                      decoration: InputDecoration(
//                        hintText: 'Pesquise aqui...',
//                        border: InputBorder.none,
//
//                      ),
//                      onChanged: (text){
//                        //TODO add search action here
//                      },
//                      onSubmitted: (text){
//                        //TODO add search action here
//                      },
//                    ),
//                  ),
//                ),
//              ),
//              builder: (context, child) => new Transform.translate(
//                offset: Offset(0.0, featuredImageAnimation.value),
//                child: child,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  _buildProductOptionList(){
//    return SliverToBoxAdapter(
//      child: SizedBox(
//        height: 100.0,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//              child: Text('Outros Productos', style: RapidinhoTextStyle.normalText),
//            ),
//            Container(
//              height: 50.0,
//              child: ListView(
//                scrollDirection: Axis.horizontal,
//                children: MockData.products.map((product){
//                  return Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10.0),
//                    child: CircleAvatar(
//                      radius: 25.0,
//                      backgroundColor: Colors.red,
//                      child: Image.asset(product.assetPath),
//                    ),
//                  );
//                }).toList(),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  _buildAnimatedList(GlobalKey<AnimatedListState> _key, List<HomeCard> list){
//    _list = ListModel(_key, list);
//    return SliverToBoxAdapter(
//      child: SizedBox(
//        height: 160.0,
//        child: ActiveFilters(
//          builder: (context, vm){
//            print('Active Filters: ${vm.activeFilters.length}');
//            return Container(
//              constraints: BoxConstraints(maxHeight: 160.0),
//              child: Align(
//                alignment: Alignment.center,
//                child: LoadedPlaces(
//                  builder: (context, vm){
//                    return AnimatedList(
//                      shrinkWrap: true,
//                      scrollDirection: Axis.horizontal,
//                      key: _key,
//                      initialItemCount: list.length,
//                      itemBuilder: (context, index, animation){
//                        return HomeCardItem(MockData.deliveries[index].vendor, list[index].name, () {}, AssetImage(list[index].assetPath), animation);
//                      },
//                    );
//                  }
//                ),
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final Size screenSize = MediaQuery.of(context).size;
//    return ActiveTab(
//      builder: (context,NavigationTab activeTab){
//        currentTab.value = activeTab.index;
//        return Container(
//          alignment: Alignment.topCenter,
//          margin: EdgeInsets.only(top: kToolbarHeight),
//          child: CustomScrollView(
//            slivers: <Widget>[
//              _buildFeaturedImage(screenSize),
//              _buildAnimatedList(_listKey1, homeCardItemList1),
//              _buildProductOptionList(),
//              _buildAnimatedList(_listKey2, homeCardItemList2),
//              _buildAnimatedList(_listKey3, homeCardItemList3),
//            ],
//          ),
//        );
//      },
//    );
//  }
//}
