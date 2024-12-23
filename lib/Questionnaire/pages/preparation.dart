import 'package:flutter/material.dart';

class Preparation extends StatefulWidget {
  const Preparation({super.key});

  @override
  _PreparationState createState() => _PreparationState();
}

class _PreparationState extends State<Preparation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preparation'),
      ),
      body: Center(
        child: Text('Preparation Page'),
      ),
    );
  }
}
