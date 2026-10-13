import 'package:flutter/material.dart';
import 'screens/home_page.dart';

// Every Flutter app starts from main()
void main() {
  runApp(const MyShopApp());
}

// The root widget of the app
class MyShopApp extends StatelessWidget {
  const MyShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp gives us navigation, themes and Material widgets
    return MaterialApp(
      title: 'MyShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // One seed color -> consistent colors across the whole app
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      // The first screen the user sees
      home: const HomePage(),
    );
  }
}
