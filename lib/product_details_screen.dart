import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/cart_screen.dart';
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

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  late int cartQuantity;
  late Product product;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    updateCartItem();
  }

  void updateCartItem() {
    setState(() {
      cartQuantity = CartDb.getCartQuantityByProductId(product.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "images/${product.image}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "\$${product.price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 16),
            if (cartQuantity != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () {
                      if (cartQuantity > 1) {
                        CartDb.addToCart(product.productId, cartQuantity - 1);
                        updateCartItem();
                        widget.onCartUpdate();
                      }
                    },
                  ),
                  SizedBox(width: 16),
                  Text(
                    cartQuantity.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.green, size: 32),
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
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (cartQuantity == 0) {
                    CartDb.addToCart(product.productId, 1);
                  } else {
                    CartDb.removeFromCart(product.productId);
                  }
                  updateCartItem();
                  widget.onCartUpdate();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor:
                      cartQuantity == 0 ? Colors.blueAccent : Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  cartQuantity == 0 ? "Add To Cart" : "Remove From Cart",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
