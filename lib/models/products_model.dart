import 'products.dart';

class ProductsModel {
  List<Product>? products = [];

  ProductsModel({this.products});

 /* Product? getById(int id) =>
      products?.firstWhere((element) => element.id == id, orElse: null);

  Product? getByPosition(int position) => products?[position];*/

  ProductsModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
