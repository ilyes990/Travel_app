import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/const.dart';
import 'package:travel_app/onBoarding/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    Gemini.init(apiKey: GEM_API_KEY);
  } catch (e) {
    // Handle initialization error
    print("Error initializing Gemini: $e");
  }
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 27, 27, 27),
          useMaterial3: false,
          fontFamily: 'Neuton',
          brightness: Brightness.dark,
        ),
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: 'Neuton',
          useMaterial3: false,
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Neuton'),
        ),
        home: OnboardingView());
  }
}

/* 

each adventure has a title, 


*/
