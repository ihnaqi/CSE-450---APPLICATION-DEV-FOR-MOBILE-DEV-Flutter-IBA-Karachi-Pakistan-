import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:mid_practice/productcart/cart.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> products = [
    Product("Laptop", 0),
    Product("Mobile", 0),
    Product("Handfree", 0),
    Product("Keyboard", 0),
    Product("Monitor", 0),
    Product("Air Pod", 0),
    Product("Loud Speaker", 0),
    Product("Mouse", 0),
    Product("Printer", 0),
    Product("Xbox", 0),
  ];

  @override
  Widget build(BuildContext context) {
    int count = 0;
    List<Product> list = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: products
              .map(
                (product) => ProductRibbon(
                  product: product,
                  onCountChange: (int val) => setState(
                    () => {
                      print(count),
                      if (list.contains(product))
                        {
                          list.remove(product),
                          product.quantity += 1,
                          list.add(product),
                        }
                      else
                        {
                          list.add(product),
                        },
                      count += val,
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Cart(list: list),
            ),
          ),
        },
        child: Badge(
          toAnimate: true,
          badgeContent: Text('${list.length}'),
          child: const Icon(
            Icons.shopping_cart,
          ),
        ),
      ),
    );
  }
}

class ProductRibbon extends StatefulWidget {
  const ProductRibbon(
      {Key? key, required this.product, required this.onCountChange})
      : super(key: key);
  final Product product;
  final Function(int) onCountChange;
  @override
  State<ProductRibbon> createState() => _ProductRibbonState();
}

class _ProductRibbonState extends State<ProductRibbon> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(
              widget.product.name[0].toUpperCase(),
            ),
          ),
        ),
        Expanded(
          child: Text(widget.product.name),
        ),
        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  count += 1;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                ),
              ),
              count > 0
                  ? Text('$count')
                  : const SizedBox(
                      width: 1,
                      height: 1,
                    ),
              count > 0
                  ? IconButton(
                      onPressed: () {
                        count -= 1;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.remove_circle_rounded,
                      ),
                    )
                  : const SizedBox(
                      width: 1,
                      height: 1,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  int quantity;

  Product(
    this.name,
    this.quantity,
  );
}
