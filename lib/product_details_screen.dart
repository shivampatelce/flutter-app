import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/cart_screen.dart';
import 'package:flutterprjgroup3/checkout_screen.dart';
import 'package:flutterprjgroup3/product.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Product product;
  final VoidCallback onCartUpdate;

  const ProductsDetailsScreen({
    Key? key,
    required this.product,
    required this.onCartUpdate,
  }) : super(key: key);

  @override
  _ProductsDetailsScreenState createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> with TickerProviderStateMixin {
  late int cartQuantity;
  late Product product;

  late AnimationController _imageController;
  late AnimationController _contentController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    updateCartItem();

    // Animations
    _imageController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _contentController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero).animate(CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOut,
    ));

    _imageController.forward();
    _contentController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void updateCartItem() {
    setState(() {
      cartQuantity = CartDb.getCartQuantityByProductId(product.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 28, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animated Product Image
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/${product.image}",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.broken_image, size: 80, color: Colors.grey),
                    )
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Slide-in Animated Content
            SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cart Actions
                  Center(
                    child: Column(
                      children: [
                        if (cartQuantity > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle, color: Colors.redAccent, size: 30),
                                onPressed: () {
                                  if (cartQuantity > 1) {
                                    CartDb.addToCart(product.productId, cartQuantity - 1);
                                    updateCartItem();
                                    widget.onCartUpdate();
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  cartQuantity.toString(),
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle, color: Colors.green, size: 30),
                                onPressed: () {
                                  if (cartQuantity < 5) {
                                    CartDb.addToCart(product.productId, cartQuantity + 1);
                                    updateCartItem();
                                    widget.onCartUpdate();
                                  }
                                },
                              ),
                            ],
                          ),
                        const SizedBox(height: 10),
                        // Add/Remove Cart Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (cartQuantity == 0) {
                                CartDb.addToCart(product.productId, 1);
                              } else {
                                CartDb.removeFromCart(product.productId);
                              }
                              updateCartItem();
                              widget.onCartUpdate();
                            },
                            icon: Icon(cartQuantity == 0 ? Icons.add_shopping_cart : Icons.delete),
                            label: Text(
                              cartQuantity == 0 ? "Add to Cart" : "Remove from Cart",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: cartQuantity == 0 ? Colors.blueAccent : Colors.redAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Text(product.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  Text("\$${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 20, color: Colors.green[700], fontWeight: FontWeight.w600)),
                  const SizedBox(height: 24),

                  Text("Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(product.shortDescription,
                      style: TextStyle(fontSize: 16, color: Colors.grey[800])),

                  const SizedBox(height: 24),
                  Text("Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(product.longDescription,
                      style: TextStyle(fontSize: 16, color: Colors.grey[800], height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
