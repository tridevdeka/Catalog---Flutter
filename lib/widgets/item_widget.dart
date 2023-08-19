import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/widgets/ui_helper.dart';

class ProductItemWidget extends StatelessWidget {
  final Product products;
  final noImageFound =
      "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg";

  const ProductItemWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Card buildCard() {
    return Card(
    child: ListTile(
      onTap: () {
        UiHelpers.showToast("${products.name}");
      },
      leading: Image.network(products.image ?? noImageFound),
      title: Text(products.name ?? "Not available"),
      subtitle: Text(products.description ?? "Not available"),
      trailing: Text(
        "\$${products.price}",
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
      ),
    ),
  );
  }
}
