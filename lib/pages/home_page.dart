import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_ecom/models/catelog.dart';
import 'package:flutter_ecom/widgets/drawer.dart';
import 'package:flutter_ecom/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final name = "Aditya";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/files/prolist.json");
    var listDecoded = jsonDecode(catelogJson);
    var productData = listDecoded["products"];
    CatelogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    //print(productData);
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(94, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce App'),
      ),
      body: (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
          ? ListView.builder(
              itemCount: CatelogModel.items?.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: CatelogModel.items![index],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }
}
