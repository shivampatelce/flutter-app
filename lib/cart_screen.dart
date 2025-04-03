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
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
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
                            elevation: 5,
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    "images/luxurious_upholstered_bed_set.jpg",
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "\$${product.price.toString()}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              if (cartQuantity > 1) {
                                                CartDb.addToCart(
                                                  product.productId,
                                                  cartQuantity - 1,
                                                );
                                                updateCart();
                                              }
                                            },
                                          ),
                                          Text(
                                            cartQuantity.toString(),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.green,
                                            ),
                                            onPressed: () {
                                              if (cartQuantity < 5) {
                                                CartDb.addToCart(
                                                  product.productId,
                                                  cartQuantity + 1,
                                                );
                                                updateCart();
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          CartDb.removeFromCart(cart.productId);
                                          updateCart();
                                        },
                                        child: Text("Remove From Cart"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(),
                            ),
                          );
                        },
                        child: Text("Proceed to Checkout"),
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                child: Text(
                  "Your Cart Is Empty.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
        ],
      ),
    );
  }
}
