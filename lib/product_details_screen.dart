import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/product.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductsDetailsScreen({Key? key, required this.product})
    : super(key: key);

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
      appBar: AppBar(title: Text(product.title)),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/luxurious_upholstered_bed_set.jpg"),
              height: 200,
            ),
            Text('Title: ${product.title}'),
            Text('Price: ${product.price.toString()}'),
            if (cartQuantity != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (cartQuantity > 1) {
                        CartDb.addToCart(product.productId, cartQuantity - 1);
                        updateCartItem();
                      }
                    },
                    child: Text("-"),
                  ),
                  Text(cartQuantity.toString()),
                  TextButton(
                    onPressed: () {
                      if (cartQuantity < 5) {
                        CartDb.addToCart(product.productId, cartQuantity + 1);
                        updateCartItem();
                      }
                    },
                    child: Text("+"),
                  ),
                ],
              ),
            cartQuantity == 0
                ? TextButton(
                  onPressed: () {
                    CartDb.addToCart(product.productId, 1);
                    updateCartItem();
                  },
                  child: Text("Add To Cart"),
                )
                : TextButton(
                  onPressed: () {
                    CartDb.removeFromCart(product.productId);
                    updateCartItem();
                  },
                  child: Text("Remove From Cart"),
                ),
          ],
        ),
      ),
    );
  }
}
