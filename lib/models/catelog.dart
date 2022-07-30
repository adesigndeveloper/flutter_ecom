class Item {
  late final String? id;
  late final String? name;
  late final String? desc;
  late final num? price;
  late final String? color;
  late final String? imageurl;
  Item({this.id, this.name, this.desc, this.price, this.color, this.imageurl});
}

final products = [
  Item(
    id: "Adi-001",
    name: "MEN'S BETTER THAN NAKED JACKET",
    desc:
        "Vel facilisi fusce odio litora tincidunt cras sollicitudin dignissim convallis consectetur efficitur nisi ac letius hendrerit ornare faucibus dictum ligula pulvinar rhoncus leo enim ullamcorper morbi",
    price: 1999,
    color: "#3505a",
    imageurl:
        "http://images.thenorthface.com/is/image/TheNorthFace/236x204_CLR/mens-better-than-naked-jacket-AVMH_LC9_hero.png",
  )
];
