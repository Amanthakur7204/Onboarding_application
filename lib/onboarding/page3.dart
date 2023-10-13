import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const SizedBox(height: 140),
        Image.asset(
          "images/car-967470_1280.png",
          height: 380,
          width: 380,
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "MODEL FOR CAR",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Chack Third Image For Car",
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
