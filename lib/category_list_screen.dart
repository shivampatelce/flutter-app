// import 'package:flutter/material.dart';
// import 'package:flutterprjgroup3/cart_screen.dart';
// import 'package:flutterprjgroup3/categories_db.dart';
// import 'package:flutterprjgroup3/product.dart';
// import 'package:flutterprjgroup3/products_screen.dart';
//
// class CategoryListScreen extends StatefulWidget {
//   @override
//   _CategoryListScreenState createState() => _CategoryListScreenState();
// }
//
// class _CategoryListScreenState extends State<CategoryListScreen> {
//   late Map<String, List<Product>> categories;
//   final TextEditingController _searchController = TextEditingController();
//   String _searchProductText = "";
//
//   @override
//   void initState() {
//     super.initState();
//     initializeCategories();
//     _searchController.addListener(() {
//       setState(() {
//         _searchProductText = _searchController.text;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void initializeCategories() {
//     categories = CategoriesDb.getCategories();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'TriSpark Gadgets',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         backgroundColor: Colors.blueAccent,
//         elevation: 4,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart, size: 28, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _searchController,
//                     decoration: InputDecoration(
//                       hintText: 'Search products...',
//                       prefixIcon: Icon(Icons.search, color: Colors.grey),
//                       fillColor: Colors.white,
//                       filled: true,
//                       contentPadding: EdgeInsets.symmetric(vertical: 14),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear, color: Colors.grey),
//                         onPressed: () {
//                           setState(() {
//                             _searchController.clear();
//                             _searchProductText = "";
//                           });
//                         },
//                       ),
//                     ),
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 IconButton(
//                   icon: Icon(Icons.search, size: 30, color: Colors.blueAccent),
//                   onPressed: () {
//                     if (_searchProductText.isNotEmpty) {
//                       List<Product> filteredProducts =
//                           categories.values
//                               .expand((list) => list)
//                               .where(
//                                 (product) => product.title
//                                     .toLowerCase()
//                                     .contains(_searchProductText.toLowerCase()),
//                               )
//                               .toList();
//
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) => ProductsScreen(
//                                 products: filteredProducts,
//                                 searchText: _searchProductText,
//                               ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//
//           // Boxes for categories
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1,
//                   mainAxisSpacing: 12,
//                   crossAxisSpacing: 12,
//                 ),
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   String categoryName = categories.keys.elementAt(index);
//                   List<Product> categoryProducts = categories[categoryName]!;
//
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) =>
//                                   ProductsScreen(products: categoryProducts),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                         image: DecorationImage(
//                           image: AssetImage('images/$categoryName.jpg'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         categoryName.toUpperCase(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                           color: Colors.white,
//                           shadows: [
//                             Shadow(
//                               color: Colors.black,
//                               offset: Offset(2, 2),
//                               blurRadius: 4,
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/cart_screen.dart';
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
  bool _loading = true;
  bool _showGrid = false;

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _searchController.addListener(() {
      setState(() {
        _searchProductText = _searchController.text;
      });
    });
  }

  void _loadCategories() async {
    await Future.delayed(Duration(milliseconds: 300)); // shorter delay
    categories = CategoriesDb.getCategories();
    setState(() {
      _loading = false;
    });

    // Short delay before animation
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() => _showGrid = true);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'TriSpark Gadgets',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
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
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.blueAccent))
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
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchProductText = "";
                          });
                        },
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.search, size: 30, color: Colors.blueAccent),
                  onPressed: () {
                    if (_searchProductText.isNotEmpty) {
                      List<Product> filteredProducts = categories.values
                          .expand((list) => list)
                          .where((product) => product.title
                          .toLowerCase()
                          .contains(_searchProductText.toLowerCase()))
                          .toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                            products: filteredProducts,
                            searchText: _searchProductText,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          // Animated Category Grid
          Expanded(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 600),
              opacity: _showGrid ? 1 : 0,
              child: AnimatedSlide(
                duration: Duration(milliseconds: 600),
                offset: _showGrid ? Offset.zero : Offset(0, 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      String categoryName = categories.keys.elementAt(index);
                      List<Product> categoryProducts = categories[categoryName]!;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductsScreen(products: categoryProducts),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('images/$categoryName.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            categoryName.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
