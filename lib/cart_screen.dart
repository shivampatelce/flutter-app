import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/categories_db.dart';
import 'package:flutterprjgroup3/category_list_screen.dart';
import 'package:flutterprjgroup3/checkout_screen.dart';
import 'package:flutterprjgroup3/product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Cart> cartItems;
  late final List<Product> products;
  double _subtotal = 0;
  double _total = 0;
  double _tax = 0;

  @override
  void initState() {
    super.initState();
    products = CategoriesDb.getCategories().values.expand((list) => list).toList();
    cartItems = CartDb.cartList;
    updateCart();
  }

  void updateCart() {
    setState(() {
      cartItems = CartDb.cartList;
    });
    updateBilling();
  }

  void updateBilling() {
    double subtotal = 0;
    cartItems.forEach((cart) {
      double productPrice = CategoriesDb.getProductPriceById(cart.productId);
      subtotal += productPrice * cart.quantity;
    });

    double tax = subtotal * 0.15; // 15% tax
    double total = subtotal + tax;

    setState(() {
      _subtotal = subtotal;
      _tax = tax;
      _total = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => CategoryListScreen()),
                  (route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          cartItems.isEmpty
              ? Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Your Cart Is Empty",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ),
            ),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                Cart cart = cartItems[index];
                Product product = products.firstWhere((p) => p.productId == cart.productId);

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                        child: Image.asset(
                          "images/${product.image}",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 15, color: Colors.green[700]),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove_circle, color: Colors.redAccent),
                                    onPressed: () {
                                      if (cart.quantity > 1) {
                                        CartDb.addToCart(product.productId, cart.quantity - 1);
                                        updateCart();
                                      }
                                    },
                                  ),
                                  Text(
                                    cart.quantity.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle, color: Colors.green),
                                    onPressed: () {
                                      if (cart.quantity < 5) {
                                        CartDb.addToCart(product.productId, cart.quantity + 1);
                                        updateCart();
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () {
                                    CartDb.removeFromCart(product.productId);
                                    updateCart();
                                  },
                                  icon: Icon(Icons.delete, color: Colors.redAccent),
                                  label: Text("Remove", style: TextStyle(color: Colors.redAccent)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Billing Summary (always shown)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal", style: TextStyle(fontSize: 16)),
                    Text("\$${_subtotal.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax (15%)", style: TextStyle(fontSize: 16)),
                    Text("\$${_tax.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Divider(height: 20, thickness: 1.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      "\$${_total.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                if (cartItems.isNotEmpty) ...[
                  SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckoutScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        "Proceed to Checkout",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
