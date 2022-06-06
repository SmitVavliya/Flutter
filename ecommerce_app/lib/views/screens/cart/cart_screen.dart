import 'package:ecommerce_app/views/screens/cart/widgets/body.dart';
import 'package:ecommerce_app/views/screens/cart/widgets/cart_empty.dart';
import 'package:ecommerce_app/views/screens/cart/widgets/check_out_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/providers/cart_provider.dart';
import '../../../models/cart_attr.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  AppBar _appBar(BuildContext context) {
    final Map<String, CartAttr> cartItems =
        Provider.of<CartProvider>(context, listen: false).cartItems;

    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${cartItems.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late Map<String, CartAttr> cartItems =
        Provider.of<CartProvider>(context, listen: false).cartItems;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: _appBar(context),
      body: cartItems.isEmpty ? const CartEmpty() : Body(),
      bottomNavigationBar:
          cartItems.isEmpty ? const SizedBox(height: 0) : const CheckoutCard(),
    );
  }
}
