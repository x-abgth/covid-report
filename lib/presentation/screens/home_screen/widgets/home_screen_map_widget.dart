import 'package:flutter/material.dart';

class HomeScreenMapWidget extends StatelessWidget {
  const HomeScreenMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0.5,
              offset: Offset(1, 1),
            ),
          ]),
      child: const Center(child: Text("Map Here!")),
    );
  }
}
