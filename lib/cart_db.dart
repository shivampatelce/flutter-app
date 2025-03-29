import 'package:flutterprjgroup3/cart.dart';

class CartDb {
  static late List<Cart> cartList = [];

  static void addToCart(int productId, int quantity) {
    Cart existingProduct = cartList.firstWhere(
          (cartItem) => cartItem.productId == productId,
          orElse: () => Cart(productId, 0),
    );

    if (existingProduct.quantity == 0) {
      cartList.add(Cart(productId, quantity));
    } else {
      existingProduct.quantity = quantity;
    }
  }

  static int getCartQuantityByProductId(int productId) {
    Cart? product = cartList.firstWhere(
          (cartItem) => cartItem.productId == productId,
      orElse: () => Cart(productId, 0),
    );

    return product.quantity;
  }

  static void removeFromCart(int productId) {
    cartList.removeWhere((cartItem) => cartItem.productId == productId);
  }
}