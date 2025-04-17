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

  ProductsScreen({Key? key, required this.products, this.searchText = ""})
    : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late final List<Product> products;
  late List<Cart> cart;
  final TextEditingController _searchController = TextEditingController();
  String _searchControlText = "";
  String _currentSearchText = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    products = widget.products;
    Future.delayed(Duration(milliseconds: 500), () {
      updateCart();
      setState(() {
        _isLoading = false;
      });
    });

    if (widget.searchText.isNotEmpty) {
      _currentSearchText = widget.searchText;
      _searchController.text = widget.searchText;
    }

    _searchController.addListener(() {
      setState(() {
        _searchControlText = _searchController.text;
      });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
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
      body:
          _isLoading
              ? Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              )
              : Column(
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
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _searchControlText = "";
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            List<Product> filteredProducts =
                                CategoriesDb.getCategories().values
                                    .expand((list) => list)
                                    .where(
                                      (product) =>
                                          product.title.toLowerCase().contains(
                                            _searchControlText.toLowerCase(),
                                          ),
                                    )
                                    .toList();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ProductsScreen(
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
                        "Results for: ${_currentSearchText}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Expanded(
                    child:
                        products.isNotEmpty
                            ? GridView.builder(
                              padding: EdgeInsets.all(12),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.65,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                Product product = products[index];
                                int productId = product.productId;
                                int cartQuantity =
                                    cart
                                        .firstWhere(
                                          (cartItem) =>
                                              cartItem.productId == productId,
                                          orElse: () => Cart(productId, 0),
                                        )
                                        .quantity;

                                return AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: 1,
                                  child: AnimatedSlide(
                                    duration: Duration(milliseconds: 500),
                                    offset: Offset(0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    ProductsDetailsScreen(
                                                      product: product,
                                                      onCartUpdate: () {
                                                        updateCart();
                                                      },
                                                    ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    top: Radius.circular(12),
                                                  ),
                                              child: Image.asset(
                                                "images/${product.image}",
                                                height: 140,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      product.title,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      "\$${product.price.toStringAsFixed(2)}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blueAccent,
                                                      ),
                                                    ),
                                                    if (cartQuantity > 0)
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.remove,
                                                            ),
                                                            onPressed: () {
                                                              if (cartQuantity >
                                                                  1) {
                                                                CartDb.addToCart(
                                                                  productId,
                                                                  cartQuantity -
                                                                      1,
                                                                );
                                                                updateCart();
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            cartQuantity
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.add,
                                                            ),
                                                            onPressed: () {
                                                              if (cartQuantity <
                                                                  5) {
                                                                CartDb.addToCart(
                                                                  productId,
                                                                  cartQuantity +
                                                                      1,
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
                                                      child: Text(
                                                        cartQuantity == 0
                                                            ? "Add to Cart"
                                                            : "Remove",
                                                      ),
                                                      style:
                                                          ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .blueAccent,
                                                            foregroundColor:
                                                                Colors.white,
                                                          ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        if (cartQuantity == 0) {
                                                          CartDb.addToCart(
                                                            productId,
                                                            1,
                                                          );
                                                          updateCart();
                                                        }
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    CheckoutScreen(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text("Buy Now"),
                                                      style:
                                                          ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.green,
                                                            foregroundColor:
                                                                Colors.white,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                            : Center(
                              child: Text(
                                "No products found for ${_currentSearchText}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                  ),
                ],
              ),
    );
  }
}
