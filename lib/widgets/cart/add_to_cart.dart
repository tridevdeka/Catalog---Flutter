import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart/cart.dart';
import '../../models/products.dart';
import 'dart:developer' as dev;

class AddToCart extends StatelessWidget {
  Product? product;

  AddToCart({this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // dev.debugger();
    //Listens to changes by made by specific operations
    VxState.watch(context, on: [AddProductMutation]);
    VxState.watch(context, on: [RemoveProductMutation]);
    CartModel cart = (VxState.store as AppStore).cartModel;
    bool isInCart = cart.productList.contains(product);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // dev.debugger();
          AddProductMutation(product!);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              context.theme.buttonTheme.colorScheme?.primary),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
