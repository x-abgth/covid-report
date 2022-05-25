import 'package:flutter/material.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;
  const ResponsiveHelper({
    Key? key,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktopView;
        }
        if (constraints.maxWidth >= 650) {
          return tabletView;
        }
        return mobileView;
      },
    );
  }
}
