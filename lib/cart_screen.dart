import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/categories_db.dart';
import 'package:flutterprjgroup3/checkout_screen.dart';
import 'package:flutterprjgroup3/product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Cart> cartItems;
  late final List<Product> products;

  @override
  void initState() {
    super.initState();
    products =
        CategoriesDb.getCategories().values.expand((list) => list).toList();
    cartItems = CartDb.cartList;
    updateCart();
  }

  void updateCart() {
    setState(() {
      cartItems = CartDb.cartList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          cartItems.isNotEmpty
              ? Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          Cart cart = cartItems[index];
                          int cartQuantity = cart.quantity;
                          Product product = products.firstWhere(
                            (product) => product.productId == cart.productId,
                          );

                          return Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/luxurious_upholstered_bed_set.jpg",
                                  height: 200,
                                ),
                                Text(product.title),
                                Text("\$${product.price}"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        if (cartQuantity > 1) {
                                          CartDb.addToCart(
                                            product.productId,
                                            cartQuantity - 1,
                                          );
                                          updateCart();
                                        }
                                      },
                                      child: Text("-"),
                                    ),
                                    Text(cartQuantity.toString()),
                                    TextButton(
                                      onPressed: () {
                                        if (cartQuantity < 5) {
                                          CartDb.addToCart(
                                            product.productId,
                                            cartQuantity + 1,
                                          );
                                          updateCart();
                                        }
                                      },
                                      child: Text("+"),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    CartDb.removeFromCart(cart.productId);
                                    updateCart();
                                  },
                                  child: Text("Remove From Cart"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Checkout Button
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CheckoutScreen())
                          );
                        },
                        child: Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              )
              : Center(child: Text("Your Cart Is Empty.")),
        ],
      ),
    );
  }
}
