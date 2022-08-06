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
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = CatelogModel.items![index];
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(color: Colors.red),
                          child: Text(
                            item.name!,
                            style: const TextStyle(color: Colors.white),
                          )),
                      child: Image.network(item.imageurl!),
                      footer: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(color: Colors.red),
                          child: Text(
                            item.price.toString(),
                            style: const TextStyle(color: Colors.white),
                          )),
                    ));
              },
              itemCount: CatelogModel.items?.length,
            )
          // ListView.builder(
          //     itemCount: CatelogModel.items?.length,
          //     itemBuilder: (context, index) {
          //       return ItemWidget(
          //         item: CatelogModel.items![index],
          //       );
          //     },
          //   )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }
}
