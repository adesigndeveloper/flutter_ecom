import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.amber,
      //shape: StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          onTap: () {
            print("${item.name}");
          },
          leading: Image.network(item.imageurl!),
          title: Text(
            item.name!,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            item.desc!,
            style: const TextStyle(color: Colors.black),
          ),
          //tileColor: Colors.white,
          trailing: Text(
            "Rs.${item.price.toString()}",
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}


// String? imgUrl;
//     if (item.imageurl != null) {
//       imgUrl = item.imageurl;
//     } else {
//       imgUrl = "assets/images/undraw_hey.png";
//     }
//     return ListTile(
//       leading: Image.network(imgUrl!),
//     );