
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.buttonTheme.colorScheme?.secondary).make(),
        "Trending products".text.color(context.theme.buttonTheme.colorScheme?.secondary).xl2.make(),
      ],
    );
  }
}
