import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:rapidinho/ui/product/product_card.dart';
import 'package:rapidinho/ui/widget/backdrop.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  final GlobalKey _globalKey = new GlobalKey(debugLabel: 'Products');

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 0.0,
      vsync: this,
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = new List<Widget>();
    int i = 0;
    slivers.addAll(_buildSideHeaderGrids(context, i, i += 10));
    return slivers;
  }

  List<Widget> _buildSideHeaderGrids(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return new SliverStickyHeader(
        overlapsContent: true,
        header: _buildSideHeader(context, sliverIndex),
        sliver: new SliverPadding(
          padding: new EdgeInsets.only(left: 100.0),
          sliver: new SliverGrid(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 1.0
            ),
            delegate: new SliverChildBuilderDelegate((context, i) => ProductCard.medium(onTap: _toggleBackdropPanelVisibility),
              childCount: 12,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSideHeader(BuildContext context, int index, {String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: new SizedBox(
          height: 50.0,
          width: 90.0,
          child: GestureDetector(
            onTap: () => Scaffold.of(context).showSnackBar(new SnackBar(content: Text('$index'))),
            child: new Text('This is \n Text Number: $index', textAlign: TextAlign.right),
          ),
        ),
      ),
    );
  }

  void _toggleBackdropPanelVisibility() {
    _controller.fling(velocity: _backdropPanelVisible ? -2.0 : 2.0);
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }


  double get _backdropHeight {
    final RenderBox renderBox = _globalKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    final double flingVelocity = details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Items Page')),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: _buildSlivers(context),
            ),
            BackdropPanel(
              color: Colors.white,
              onTap: _toggleBackdropPanelVisibility,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              controller: _controller,
              constraints: constraints,
              child: Container(),
            ),
          ],
        );
      }),
    );
  }
}