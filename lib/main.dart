import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/home_page.dart';
import 'package:flutter_ecom/pages/login_page.dart';
import 'package:flutter_ecom/utills/routes.dart';
import 'package:flutter_ecom/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        '/': (context) => const LoginPage()
      },
    );
  }
}
