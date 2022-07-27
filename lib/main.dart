import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/home_page.dart';
import 'package:flutter_ecom/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.red),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/home",
      routes: {
        '/home': (context) => const LoginPage(),
        '/login': (context) => const HomePage(),
        '/': (context) => const LoginPage()
      },
    );
  }
}
