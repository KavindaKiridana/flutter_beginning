import 'package:flutter/material.dart';
import 'package:flutter5/hero_widget.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [HeroWidget()]),
    );
  }
}
