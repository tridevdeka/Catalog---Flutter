import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class Product {
  int? id;
  String? name;
  String? description;
  num? price;
  String? color;
  String? image;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.color,
    this.image,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['desc'];
    price = json['price'];
    color = json['color'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['desc'] = description;
    map['price'] = price;
    map['color'] = color;
    map['image'] = image;
    return map;
  }

  factory Product.fromQueryParams(Map<String, dynamic> queryParams) {
    return Product(
      id: int.parse(queryParams['id']!),
      name: queryParams['name']!,
      /*description: queryParams['desc']!,
      price: double.parse(queryParams['price']!),
      color: queryParams['color']!,
      image: queryParams['image']!,*/
    );
  }
}

class SelectProductMutation extends VxMutation<AppStore> {
  Product product;

  SelectProductMutation(this.product);

  @override
  perform() {
    // dev.debugger();
    store?.product = product;
  }
}
