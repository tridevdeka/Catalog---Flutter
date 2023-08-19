import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/cart/add_to_cart.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:developer' as dev;

import '../../models/products.dart';
import '../../widgets/themes.dart';

class CatalogList extends StatelessWidget {
  List<Product> products;

  CatalogList(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Vx.isWeb
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                //Navigator 1.0
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailPage(products[index])));*/

                Product product = products[index];
                SelectProductMutation(product);
                context.pushNamed(AppRoutes.homeDetailRoute,  queryParams: {'id':product.id.toString()});
              },
              child: CatalogItem(products[index]),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            itemCount: products.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailPage(products[index])));*/

                Product product = products[index];
                SelectProductMutation(product);
                context.pushNamed(AppRoutes.homeDetailRoute,  queryParams: {'id':product.id.toString()});
              },
              child: CatalogItem(products[index]),
            ),
          );
  }
}

class CatalogItem extends StatelessWidget {
  Product product;

  CatalogItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(product.id.toString()),
          child: CatalogImage(product.image ?? AppThemes.noImageFound)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (product.name != null && product.name!.isNotEmpty)
            product.name!.text.lg
                .color(context.theme.colorScheme.primary)
                .bold
                .make()
          else
            "Not available"
                .text
                .lg
                .color(context.theme.colorScheme.primary)
                .bold
                .make(),
          if (product.description != null && product.description!.isNotEmpty)
            product.description!.text
                .textStyle(context.captionStyle)
                .color(context.theme.colorScheme.primary)
                .make()
          else
            "Not available"
                .text
                .textStyle(context.captionStyle)
                .color(context.theme.colorScheme.primary)
                .make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${product.price}"
                  .text
                  .bold
                  .xl
                  .color(context.theme.colorScheme.primary)
                  .make(),
              AddToCart(product: product)
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(Vx.isWeb ? 16 : 0))
    ];
    return VxBox(
            child: Vx.isMobileOS
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}
