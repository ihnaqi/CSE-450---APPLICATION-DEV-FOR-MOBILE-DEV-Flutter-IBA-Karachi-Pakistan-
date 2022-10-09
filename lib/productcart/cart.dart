import 'package:flutter/material.dart';
import 'package:mid_practice/productcart/products.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<Product> list;
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(),
    );
  }
}
