import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:rapidinho/model/product_category.dart';
import 'package:rapidinho/ui/product/product_card.dart';
import 'package:rapidinho/ui/product/product_grid.dart';
import 'package:rapidinho/ui/widget/backdrop.dart';

class ProductsPage extends StatefulWidget {

  final ProductType product;
  ProductsPage(this.product);

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
      duration: const Duration(milliseconds: 500),
      value: 0.0,
      vsync: this,
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
        int i = 0;
        return Stack(
          children: <Widget>[
            ProductGrid(onTap: _toggleBackdropPanelVisibility, productType: widget.product),
            IgnorePointer(
              ignoring: !_backdropPanelVisible,
              child: GestureDetector(
                onTap: _toggleBackdropPanelVisibility,
                child: Container(
                  color: Colors.transparent.withOpacity(_controller.value / 2),
                ),
              ),
            ),
            BackdropPanel(
              key: _globalKey,
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