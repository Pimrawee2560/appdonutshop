import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:flutter_application_1/utils/cart_provider.dart';
import 'package:flutter_application_1/pages/homescreen.dart';
import 'package:provider/provider.dart';

class CurryScreen extends StatefulWidget {
  final int type;

  const CurryScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<CurryScreen> createState() => _CurryScreenState();
}

class _CurryScreenState extends State<CurryScreen> {
  late Future<List<Cart>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems =
        Provider.of<CartProvider>(context, listen: false).getCartItems();
  }

  String getTypeName(int type) {
    switch (type) {
      case 1:
        return 'Mobile Banking';
      case 2:
        return 'Credit Card';
      case 3:
        return 'Paypal';
      case 4:
        return 'Cash on delivery';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E3232),
        centerTitle: true,
        title: const Text(
          'กำลังจัดส่ง',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/car.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16),
              Text(
                'กำลังจัดส่งสินค้า...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              FutureBuilder(
                future: _cartItems,
                builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Cart item = snapshot.data![index];
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.productname.toString()),
                                  Spacer(),
                                  Text(item.productPrice.toString()),
                                ],
                              ),
                              // Add more details if needed
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Total Price: \$${cart.getTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 16),
              Text(
                'Selected Payment Type: ${getTypeName(widget.type)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
