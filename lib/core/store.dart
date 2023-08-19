import 'package:flutter_catalog/models/cart/cart.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/models/products_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:developer' as dev;

class AppStore extends VxStore {
  CartModel cartModel = CartModel();
  Product product = Product();
}
