import 'package:flutter/material.dart';

class HomeScreenMobile extends StatelessWidget {
  final String appTitle = "Covid Reports";

  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
