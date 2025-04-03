import 'package:flutterprjgroup3/product.dart';

class CategoriesDb {
  static Map<String, List<Product>> getCategories() {
    List<Product> category1Products = [];
    List<Product> category2Products = [];

    category1Products.add(
      Product(
        1,
        "title-1",
        "shortDescription",
        "longDescription",
        50.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );
    category1Products.add(
      Product(
        2,
        "title-2",
        "shortDescription",
        "longDescription",
        60.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );
    category1Products.add(
      Product(
        3,
        "title-3",
        "shortDescription",
        "longDescription",
        70.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );

    category2Products.add(
      Product(
        4,
        "title-4",
        "shortDescription",
        "longDescription",
        50.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );
    category2Products.add(
      Product(
        5,
        "title-5",
        "shortDescription",
        "longDescription",
        60.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );
    category2Products.add(
      Product(
        6,
        "title-6",
        "shortDescription",
        "longDescription",
        70.00,
        "luxurious_upholstered_bed_set.jpg",
      ),
    );

    Map<String, List<Product>> categories = {
      "laptops": category1Products,
      "mobiles": category2Products,
      "tvs": []
    };

    return categories;
  }
}
