import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/widgets/cart/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class HomeDetailPage extends StatelessWidget {
  Product product = Product();
  final Map<String, String> queryParams;
  final int id = 0;

  HomeDetailPage({required this.queryParams, super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [SelectProductMutation]);
    Product product = (VxState.store as AppStore).product;
    this.product = product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${product.price}".text.bold.xl4.red600.make(),
            AddToCart(product: product).wh(130, 50)
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(product.id.toString()),
                  child: Image.network(product.image ?? AppThemes.noImageFound))
              .h32(context)
              .p16(),
          Expanded(
              child: VxArc(
                  height: 30,
                  edge: VxEdge.top,
                  arcType: VxArcType.convey,
                  child: SingleChildScrollView(
                    child: Container(
                      width: context.screenWidth,
                      color: context.cardColor,
                      child: Column(children: [
                        if (product.name != null && product.name!.isNotEmpty)
                          product.name!.text.xl4
                              .color(context.theme.colorScheme.primary)
                              .bold
                              .make()
                        else
                          "Not available"
                              .text
                              .xl4
                              .color(context.theme.colorScheme.primary)
                              .bold
                              .make(),
                        if (product.description != null &&
                            product.description!.isNotEmpty)
                          product.description!.text
                              .textStyle(context.captionStyle)
                              .color(context.theme.colorScheme.primary)
                              .xl
                              .make()
                        else
                          "Not available"
                              .text
                              .textStyle(context.captionStyle)
                              .color(context.theme.colorScheme.primary)
                              .xl
                              .make(),
                        12.heightBox,
                        "Attitude, honor, and future.Ecce, clemens cotta! With tofus drink gravy.Attitude, honor, and future.Ecce, clemens cotta! With tofus drink gravy.Attitude, honor, and future.Ecce, clemens cotta! With tofus drink gravy.Attitude, honor, and future.Ecce, clemens cotta! With tofus drink gravy."
                            .text
                            .textStyle(context.captionStyle)
                            .color(context.theme.colorScheme.primary)
                            .make()
                            .p16()
                      ]).py64(),
                    ),
                  )))
        ]),
      ),
    );
  }
}
