import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/cart_screen.dart';
import 'package:flutterprjgroup3/categories_db.dart';
import 'package:flutterprjgroup3/category_list_screen.dart';
import 'package:flutterprjgroup3/checkout_screen.dart';
import 'package:flutterprjgroup3/product.dart';
import 'package:flutterprjgroup3/product_details_screen.dart';

class ProductsScreen extends StatefulWidget {
  final List<Product> products;
  final String searchText;

  const ProductsScreen({Key? key, required this.products, this.searchText = ""})
    : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with SingleTickerProviderStateMixin {
  late final List<Product> products;
  late List<Cart> cart;
  final TextEditingController _searchController = TextEditingController();
  String _searchControlText = "";
  String _currentSearchText = "";

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    products = widget.products;
    cart = CartDb.cartList;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    if (widget.searchText.isNotEmpty) {
      _currentSearchText = widget.searchText;
      _searchController.text = widget.searchText;
    }

    _searchController.addListener(() {
      _searchControlText = _searchController.text;
    });
  }

  void updateCart() {
    setState(() {
      cart = CartDb.cartList;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => CategoryListScreen()),
              (route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 28,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _searchControlText = "";
                        },
                      ),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    final filteredProducts =
                        CategoriesDb.getCategories().values
                            .expand((list) => list)
                            .where(
                              (product) => product.title.toLowerCase().contains(
                                _searchControlText.toLowerCase(),
                              ),
                            )
                            .toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => ProductsScreen(
                              products: filteredProducts,
                              searchText: _searchControlText,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (_currentSearchText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Results for: $_currentSearchText",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Expanded(
            child:
                products.isNotEmpty
                    ? AnimatedBuilder(
                      animation: _scaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: child,
                        );
                      },
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          final productId = product.productId;
                          final cartQuantity =
                              cart
                                  .firstWhere(
                                    (c) => c.productId == productId,
                                    orElse: () => Cart(productId, 0),
                                  )
                                  .quantity;

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => ProductsDetailsScreen(
                                        product: product,
                                        onCartUpdate: updateCart,
                                      ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      "images/${product.image}",
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              product.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "\$${product.price.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            if (cartQuantity > 0)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.remove,
                                                    ),
                                                    iconSize: 18,
                                                    onPressed: () {
                                                      if (cartQuantity > 1) {
                                                        CartDb.addToCart(
                                                          productId,
                                                          cartQuantity - 1,
                                                        );
                                                        updateCart();
                                                      }
                                                    },
                                                  ),
                                                  Text(
                                                    cartQuantity.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(Icons.add),
                                                    iconSize: 18,
                                                    onPressed: () {
                                                      if (cartQuantity < 5) {
                                                        CartDb.addToCart(
                                                          productId,
                                                          cartQuantity + 1,
                                                        );
                                                        updateCart();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ElevatedButton(
                                              onPressed: () {
                                                if (cartQuantity == 0) {
                                                  CartDb.addToCart(
                                                    productId,
                                                    1,
                                                  );
                                                } else {
                                                  CartDb.removeFromCart(
                                                    productId,
                                                  );
                                                }
                                                updateCart();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                cartQuantity == 0 ? Colors.blueAccent : Colors.redAccent,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              child: Text(
                                                cartQuantity == 0
                                                    ? "Add to Cart"
                                                    : "Remove",
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (_) => CheckoutScreen(totalAmount: product.price,),
                                                  ),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                    ),
                                                textStyle: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              child: const Text("Buy Now"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : Center(
                      child: Text(
                        "No products found for $_currentSearchText",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
