import 'package:flutter/material.dart';

class HomeScreenInfoCard extends StatelessWidget {
  final String title;
  final String currentVal;
  final String totalVal;
  final bool isRecovered;

  const HomeScreenInfoCard({
    Key? key,
    required this.title,
    required this.currentVal,
    required this.totalVal,
    this.isRecovered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 0.5,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                letterSpacing: 1.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          Text(
            currentVal,
            style: TextStyle(
                letterSpacing: 1.0,
                color: isRecovered ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          Text(
            totalVal,
            style: const TextStyle(
                letterSpacing: 1.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
