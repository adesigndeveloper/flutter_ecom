// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_ecom/models/catelog.dart';
import 'package:flutter_ecom/widgets/themes.dart';

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
        body: SafeArea(
            child: Container(
      padding: Vx.m16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CatelogHeader(),
          if (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
            const CatelogList().expand()
          else
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    )));
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "WebPino E-Com App".text.xl3.bold.color(MyTheme.darkRedishColor).make(),
        "Tranding Products".text.xl2.make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatelogModel.items?.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items![index];
        return CatelogItem(catelog: catelog);
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatelogImage(
          image: catelog.imageurl!,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.color(MyTheme.darkRedishColor).bold.make().py12(),
            catelog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH12,
              children: [
                "Rs. ${catelog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkRedishColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make()),
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(180).make().py12();
  }
}

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(MyTheme.creamColor)
        .make()
        .p12()
        .w40(context);
  }
}
