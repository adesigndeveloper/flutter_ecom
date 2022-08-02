class CatelogModel {
  static List<Item>? items;
}

class Item {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? imageurl;
  Item({this.id, this.name, this.desc, this.price, this.color, this.imageurl});

  //convert json into map for using in app screen
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageurl: map["imageurl"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "imageurl": imageurl
      };
}
