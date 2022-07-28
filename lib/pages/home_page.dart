import 'package:flutter/material.dart';
import 'package:flutter_ecom/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final name = "Aditya";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce App'),
      ),
      body: Center(child: Text('Welcome to $days days of flutter by $name')),
      drawer: const MyDrawer(),
    );
  }
}
