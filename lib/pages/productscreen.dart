import 'dart:async';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/utils/cart_provider.dart';
import 'package:flutter_application_1/utils/db_helper.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  DBhelper dBhelper = DBhelper();
  bool ontapped = false;
  List<String> productImages = [
    "assets/images/ORANGESMOTHIE.png",
    "assets/images/STRAWBERRYSMOTHIE.png",
    "assets/images/COCOASHAKE.png",
    "assets/images/GREENTEA.png",
    "assets/images/COFFEE.png",
  ];
  List<String> productname = [
    "ORANGE SMOTHIE",
    "STRAWBERRY SMOTHIE",
    "COCOA SHAKE",
    "GREEN TEA",
    "COFFEE",
  ];
  List<int> productprice = [50, 70, 70, 70, 70];
  timer() {
    return Timer(const Duration(seconds: 2), () {
      setState(() {
        ontapped = false;
      });
    });
  }

  ontappedfunc(index) {
    if (ontapped == false) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey),
          child: Image.asset(productImages[index]),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3232),
        centerTitle: true,
        title: const Text(
          'Drink',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                // setState(() {
                //   ontapped = true;
                // });
                Navigator.pushNamed(context, Routename.cartscreen);
              },
              child: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(value.getCounter().toString());
                  },
                ),
                badgeAnimation: const badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 200)),
                badgeStyle: const badges.BadgeStyle(elevation: 5),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productname.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          // ontappedfunc(index),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey),
                              child: Image.asset(productImages[index]),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(productname[index].toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(productprice[index].toString()),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: InkWell(
                                      onTap: () {
                                        dBhelper
                                            .insert(Cart(
                                                id: index,
                                                productPrice:
                                                    productprice[index],
                                                // icon: icons[index],
                                                initalPrice:
                                                    productprice[index],
                                                productid: index.toString(),
                                                productname: productname[index],
                                                quantity: 1))
                                            .then((value) {
                                          cart.addTotalPrice(double.parse(
                                              productprice[index].toString()));
                                          cart.addCounter();
                                          print("Product Added to cart");
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
                                      },
                                      child: Ink(
                                        height: 35,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xFF3E3232),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Add to Cart",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
