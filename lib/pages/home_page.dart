import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/catelog.dart';
import 'package:flutter_ecom/widgets/drawer.dart';
import 'package:flutter_ecom/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final name = "Aditya";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(94, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce App'),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
