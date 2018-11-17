import 'package:flutter/material.dart';

class BackdropPanel extends StatelessWidget {
  BackdropPanel({
    Key key,
    this.onTap,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.title,
    this.child,
    this.color,
    this.secondTitle,
    this.icon,
    this.constraints,
    this.controller,
  }) : super(key: key);

  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget secondTitle;
  final Widget child;
  final Color color;
  final Icon icon;
  final BoxConstraints constraints;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;
    final Animation<RelativeRect> panelAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        panelTop - MediaQuery.of(context).padding.bottom,
        0.0,
        panelTop - panelSize.height,
      ),
      end: RelativeRect.fromLTRB(0.0, panelTop / 2.5, 0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    );
    return PositionedTransition(
      rect: panelAnimation,
      child: Material(
        shadowColor: Colors.grey[900],
        color: color,
        elevation: 20.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: onVerticalDragUpdate,
              onVerticalDragEnd: onVerticalDragEnd,
              onTap: onTap,
              child: Container(
                height: 48.0,
                padding: EdgeInsetsDirectional.only(start: 24.0, end: 24.0),
                alignment: AlignmentDirectional.centerStart,
                child: DefaultTextStyle(
                  style: theme.textTheme.subhead,
                  child: Row(
                    children: <Widget>[
                      Tooltip(
                        message: 'Tap to dismiss',
                        child: title,
                      ),
                      Expanded(child: Container(child: icon)),
                      Tooltip(
                        message: 'Tap to dismiss',
                        child: secondTitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 1.0),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}


class BackdropTitle extends AnimatedWidget {
  BackdropTitle({
    Key key,
    Listenable listenable,
  }) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return DefaultTextStyle(
      style: Theme.of(context).primaryTextTheme.title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: CurvedAnimation(
              parent: ReverseAnimation(animation),
              curve: Interval(0.5, 1.0),
            ).value,
            child: Text('Select a Category'),
          ),
          Opacity(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Interval(0.5, 1.0),
            ).value,
            child: Text('Asset Viewer'),
          ),
        ],
      ),
    );
  }
}