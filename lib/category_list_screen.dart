import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/categories_db.dart';
import 'package:flutterprjgroup3/product.dart';
import 'package:flutterprjgroup3/products_screen.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late Map<String, List<Product>> categories;
  final TextEditingController _searchController = TextEditingController();
  String _searchProductText = "";

  @override
  void initState() {
    super.initState();
    initializeCategories();
    _searchController.addListener(() {
      setState(() {
        _searchProductText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void initializeCategories() {
    categories = CategoriesDb.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
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
                TextButton(onPressed: () {
                  if(_searchProductText != '') {
                    List<Product> filteredProducts = categories.values
                        .expand((list) => list)
                        .where((product) =>
                        product.title
                            .toLowerCase()
                            .contains(_searchProductText.toLowerCase()))
                        .toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                            ProductsScreen(products: filteredProducts, searchText: _searchProductText),
                      ),
                    );
                  }
                }, child: Text("Search"))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                String categoryTitle = categories.keys.elementAt(index);
                List<Product> productList = categories[categoryTitle] ?? [];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                ProductsScreen(products: productList),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.blueAccent,
                    child: Column(children: [Text(categoryTitle)]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
