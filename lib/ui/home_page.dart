import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/products_model.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';
import '../models/cart/cart.dart';
import '../models/products.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';
import 'dart:developer' as dev;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product>? products = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var resp = await rootBundle.loadString("assets/files/catalog.json");

    // dev.log(resp);
    // debugPrint(resp);
    // dev.debugger();

    // First parsing
    /*var decoded = jsonDecode(resp);
    var productList = decoded["products"];
    var product = ProductsModel(List.from(productList)
        .map<Products>((products) => Products.fromJson(products))
        .toList());
    products = product.products!;*/

    //Second parsing
    var decoded = jsonDecode(resp);
    var productModel = ProductsModel.fromJson(decoded);
    products = productModel.products!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BuildContext called");
    VxState.watch(context, on: [AddProductMutation]);
    VxState.watch(context, on: [RemoveProductMutation]);
    CartModel cart = (VxState.store as AppStore).cartModel;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonTheme.colorScheme?.primary,
        onPressed: () {
          context.pushNamed(AppRoutes.cartRoute);
        },
        child: Icon(CupertinoIcons.cart),
      ).badge(color: Vx.red500,size: 20,count: cart.productList.length),
      body: SafeArea(
        child: Container(
          padding: Vx.mOnly(left: 20.0, right: 20.0, top: 20.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (products != null && products!.isNotEmpty)
                CatalogList(products!).expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Catalog",
        ),
      ),
      body: (products != null && products!.isNotEmpty)
          ? _populateListView()
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: AppDawer(),
    );
  }

  GridView _populateGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        /*mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,*/
        // childAspectRatio: 1.0
      ),
      itemBuilder: (context, index) => Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: GridTile(
            header: Container(
                decoration: BoxDecoration(color: Colors.purple),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Text(
                  products![index].name ?? "Not available",
                  style: TextStyle(color: Colors.white),
                )),
            footer: Container(
                decoration: BoxDecoration(color: Colors.black),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Text("\$${products![index].price}",
                    style: TextStyle(color: Colors.white))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  products![index].image ?? AppThemes.noImageFound,
              errorBuilder:(context,error,stackTrace){
                    return "Error loading image".text.make();
              },),
            )),
      ),
      itemCount: products!.length,
    );
  }

  ListView _populateListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      itemCount: products!.length,
      itemBuilder: (context, index) =>
          ProductItemWidget(products: products![index]),
    );
  }
}
