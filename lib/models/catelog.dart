class CatelogModel {
  static final items = [
    Item(
      id: 1,
      name: "MEN'S BETTER THAN NAKED JACKET",
      desc:
          "Vel facilisi fusce odio litora tincidunt cras sollicitudin dignissim ",
      price: 1999,
      color: "#3505a",
      imageurl:
          "http://images.thenorthface.com/is/image/TheNorthFace/236x204_CLR/mens-better-than-naked-jacket-AVMH_LC9_hero.png",
    )
  ];
}

class Item {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? imageurl;
  Item({this.id, this.name, this.desc, this.price, this.color, this.imageurl});
}
