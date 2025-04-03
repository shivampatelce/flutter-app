import 'package:flutterprjgroup3/product.dart';

class CategoriesDb {
  static Map<String, List<Product>> getCategories() {
    List<Product> category1Products = [];
    List<Product> category2Products = [];
    List<Product> category3Products = [];
    List<Product> category4Products = [];
    List<Product> category5Products = [];
    List<Product> category6Products = [];

    // Laptops
    category1Products.addAll([
      Product(1, "Chromebook Laptop", "Slim & Fast", "A powerful laptop for professionals.", 899.99, "chromebook_laptop.jpg"),
      Product(2, "Laptop 2", "Gaming Beast", "High-end gaming laptop.", 1299.00, "laptops.jpg"),
      Product(3, "Laptop 3", "Everyday Use", "Reliable laptop for students.", 599.00, "laptops.jpg"),
      Product(4, "Laptop 4", "Convertible", "2-in-1 touchscreen convertible.", 749.00, "laptops.jpg"),
      Product(5, "Laptop 5", "Business Pro", "Business-grade performance.", 999.00, "laptops.jpg"),
      Product(6, "Laptop 6", "Lightweight", "Travel-friendly ultrabook.", 849.00, "laptops.jpg"),
    ]);

    // Mobiles
    category2Products.addAll([
      Product(7, "Mobile 1", "Flagship", "Top-tier performance and camera.", 1099.00, "mobiles.jpg"),
      Product(8, "Mobile 2", "Budget King", "Affordable and efficient.", 299.00, "mobiles.jpg"),
      Product(9, "Mobile 3", "Camera Pro", "Best-in-class camera setup.", 899.00, "mobiles.jpg"),
      Product(10, "Mobile 4", "Compact", "Small, sleek, and stylish.", 699.00, "mobiles.jpg"),
      Product(11, "Mobile 5", "Gaming Phone", "Optimized for mobile gaming.", 799.00, "mobiles.jpg"),
      Product(12, "Mobile 6", "All-rounder", "Great battery and display.", 649.00, "mobiles.jpg"),
    ]);

    // TVs
    category3Products.addAll([
      Product(13, "TV 1", "Smart 4K", "Crystal clear resolution.", 1199.00, "tvs.jpg"),
      Product(14, "TV 2", "LED HD", "Budget-friendly HD TV.", 399.00, "tvs.jpg"),
      Product(15, "TV 3", "QLED Display", "Enhanced color & contrast.", 999.00, "tvs.jpg"),
      Product(16, "TV 4", "Curved TV", "Immersive viewing experience.", 799.00, "tvs.jpg"),
      Product(17, "TV 5", "OLED", "Premium OLED panel.", 1499.00, "tvs.jpg"),
      Product(18, "TV 6", "Portable TV", "Compact and portable size.", 299.00, "tvs.jpg"),
    ]);

    // Cameras
    category4Products.addAll([
      Product(19, "Camera 1", "DSLR Basic", "Perfect for beginners.", 599.00, "cameras.jpg"),
      Product(20, "Camera 2", "Mirrorless", "Compact with quality output.", 899.00, "cameras.jpg"),
      Product(21, "Camera 3", "Action Cam", "Adventure-ready compact cam.", 349.00, "cameras.jpg"),
      Product(22, "Camera 4", "Professional DSLR", "For pros & creators.", 1499.00, "cameras.jpg"),
      Product(23, "Camera 5", "Vlogging Cam", "Ideal for content creators.", 799.00, "cameras.jpg"),
      Product(24, "Camera 6", "Zoom Lens Kit", "High zoom, high detail.", 999.00, "cameras.jpg"),
    ]);

    // Accessories
    category5Products.addAll([
      Product(25, "Accessory 1", "Phone Case", "Durable phone case.", 19.99, "accessories.jpg"),
      Product(26, "Accessory 2", "Laptop Sleeve", "Protect your laptop.", 25.00, "accessories.jpg"),
      Product(27, "Accessory 3", "Wireless Charger", "Fast charging pad.", 35.00, "accessories.jpg"),
      Product(28, "Accessory 4", "USB-C Hub", "Multiport expansion.", 45.00, "accessories.jpg"),
      Product(29, "Accessory 5", "Bluetooth Earbuds", "Wireless music experience.", 69.00, "accessories.jpg"),
      Product(30, "Accessory 6", "Tablet Stand", "Ergonomic viewing angle.", 29.00, "accessories.jpg"),
    ]);

    // Tablets
    category6Products.addAll([
      Product(31, "Tablet 1", "iPad Air", "Sleek and powerful.", 649.00, "tablets.jpg"),
      Product(32, "Tablet 2", "Android Tab", "Best for entertainment.", 499.00, "tablets.jpg"),
      Product(33, "Tablet 3", "Windows Tablet", "Productivity on the go.", 699.00, "tablets.jpg"),
      Product(34, "Tablet 4", "Budget Tab", "Affordable and simple.", 299.00, "tablets.jpg"),
      Product(35, "Tablet 5", "Kids Tablet", "Safe and educational.", 199.00, "tablets.jpg"),
      Product(36, "Tablet 6", "Pro Tablet", "High-end features.", 899.00, "tablets.jpg"),
    ]);


    Map<String, List<Product>> categories = {
      "laptops": category1Products,
      "mobiles": category2Products,
      "tvs": category3Products,
      "cameras": category4Products,
      "accessories": category5Products,
      "tablets": category6Products
    };

    return categories;
  }

  static double getProductPriceById(int productId) {
    for (var category in getCategories().values) {
      for (var product in category) {
        if (product.productId == productId) {
          return product.price;
        }
      }
    }
    return 0;
  }
}
