import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart.dart';
import 'package:flutterprjgroup3/cart_db.dart';
import 'package:flutterprjgroup3/categories_db.dart';
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

  @override
  void initState() {
    super.initState();
    products = widget.products;
    updateCart();
    if (widget.searchText != '') {
      _currentSearchText = widget.searchText;
      _searchController.text = widget.searchText;
    }
    _searchController.addListener(() {
      setState(() {
        _searchControlText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void updateCart() {
    setState(() {
      cart = CartDb.cartList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_searchControlText != '') {
                      List<Product> filteredProducts =
                          CategoriesDb.getCategories().values
                              .expand((list) => list)
                              .where(
                                (product) => product.title
                                    .toLowerCase()
                                    .contains(_searchControlText.toLowerCase()),
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
                    }
                  },
                  child: Text("Search"),
                ),
              ],
            ),
          ),
          if (_currentSearchText != '')
            Column(children: [Text("Results for: ${_currentSearchText}")]),

          products.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = products[index];
                    int productId = product.productId;
                    int cartQuantity =
                        cart
                            .firstWhere(
                              (cartItem) => cartItem.productId == productId,
                              orElse: () => Cart(productId, 0),
                            )
                            .quantity;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductsDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage(
                                "images/luxurious_upholstered_bed_set.jpg",
                              ),
                              height: 200,
                            ),
                            Text(product.title),
                            Text(product.price.toString()),
                            if (cartQuantity != 0)
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
                            cartQuantity == 0
                                ? TextButton(
                                  onPressed: () {
                                    CartDb.addToCart(product.productId, 1);
                                    updateCart();
                                  },
                                  child: Text("Add To Cart"),
                                )
                                : TextButton(
                                  onPressed: () {
                                    CartDb.removeFromCart(productId);
                                    updateCart();
                                  },
                                  child: Text("Remove From Cart"),
                                ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              : Center(
                child: Column(
                  children: [
                    Text(
                      "No product available for search: ${_currentSearchText}",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Go Back"),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
