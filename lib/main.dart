import 'package:flutter/material.dart';
import 'package:travel_app/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: HomeView());
  }
}
