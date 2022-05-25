import 'package:flutter/material.dart';

class HomeScreenTablet extends StatelessWidget {
  final String appTitle = "Covid Reports";
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5,
          child: Container(
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
