import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/products_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:developer' as dev;

import '../products.dart';

class CartModel {
  List<Product> productList = [];

  num get totalPrice =>
      productList.fold(0, (total, current) => total + (current.price ?? 0));

// ProductsModel? productsModel;

// CartModel({this.productsModel});

/*late ProductsModel _productsModel;
  List<int?> _productIds = [];

  ProductsModel get productModel => _productsModel;

  set productModel(ProductsModel newProductsModel) {
    _productsModel = newProductsModel;
  }

  List<Product?>? get products =>
      //Transformed into Products iterables and then converted to a list.Finally,assigned to products.
      _productIds.map((id) => _productsModel.getById(id!)).toList();

  num? get totalPrice =>
      products?.fold(0, (total, current) => total! + (current?.price ?? 0));

  void add(Product product) {
    _productIds.add(product.id);
  }

  void remove(Product product) {
    _productIds.remove(product.id);
  }*/
}

class AddProductMutation extends VxMutation<AppStore> {
  Product product;

  AddProductMutation(this.product);

  @override
  perform() {
    // dev.debugger();
    store?.cartModel.productList.add(product);
  }
}

class RemoveProductMutation extends VxMutation<AppStore> {
  Product product;

  RemoveProductMutation(this.product);

  @override
  perform() {
    // dev.debugger();
    store?.cartModel.productList.remove(product);
  }
}

