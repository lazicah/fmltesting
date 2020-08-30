import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, Size) smallScreen;
  final Widget Function(BuildContext context, Size) bigScreen;

  const ResponsiveWidget({Key key, this.smallScreen, this.bigScreen})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth > 600
          ? bigScreen(
              context, Size(constraints.maxWidth, constraints.maxHeight))
          : smallScreen(
              context, Size(constraints.maxWidth, constraints.maxHeight));
    });
  }
}
