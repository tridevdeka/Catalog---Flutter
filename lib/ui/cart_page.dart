import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddProductMutation]);
    VxState.watch(context, on: [RemoveProductMutation]);
    var cart = (VxState.store as AppStore).cartModel;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}"
              .text
              .xl4
              .color(context.theme.colorScheme.primary)
              .make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet.".text.make()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppThemes.darkBluishColor)),
              child: "Buy".text.center.make().w32(context)),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddProductMutation]);
    VxState.watch(context, on: [RemoveProductMutation]);
    CartModel cart = (VxState.store as AppStore).cartModel;
    return cart.productList.isEmpty ? "Nothing to show"
            .text
            .xl3
            .color(context.theme.colorScheme.primary)
            .makeCentered()
        : ListView.builder(
            itemCount: cart.productList.length,
            itemBuilder: (context, index) => ListTile(
              leading:
                  Icon(Icons.done, color: context.theme.colorScheme.primary),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline,
                    color: context.theme.colorScheme.primary),
                onPressed: () {
                  RemoveProductMutation(cart.productList[index]);
                },
              ),
              title: cart.productList[index].name?.text
                  .color(context.theme.colorScheme.primary)
                  .make(),
            ),
          );
  }
}
