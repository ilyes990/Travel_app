import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:travel_app/const.dart';
import 'package:travel_app/home_view.dart';

void main() {
  Gemini.init(apiKey: GEM_API_KEY);
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
