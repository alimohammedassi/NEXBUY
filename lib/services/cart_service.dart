import 'dart:async';
import '../models/user.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _cartItems = [];
  final StreamController<List<CartItem>> _cartController =
      StreamController<List<CartItem>>.broadcast();

  Stream<List<CartItem>> get cartStream => _cartController.stream;

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);

  int get itemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart({
    required String productId,
    required String productName,
    required String productImage,
    required double price,
    int quantity = 1,
    String? variant,
  }) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.productId == productId && item.variant == variant,
    );

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex] = CartItem(
        productId: _cartItems[existingItemIndex].productId,
        productName: _cartItems[existingItemIndex].productName,
        productImage: _cartItems[existingItemIndex].productImage,
        price: _cartItems[existingItemIndex].price,
        quantity: _cartItems[existingItemIndex].quantity + quantity,
        variant: _cartItems[existingItemIndex].variant,
      );
    } else {
      _cartItems.add(
        CartItem(
          productId: productId,
          productName: productName,
          productImage: productImage,
          price: price,
          quantity: quantity,
          variant: variant,
        ),
      );
    }

    // إشعار جميع المستمعين بالتغيير
    _cartController.add(List.from(_cartItems));
  }

  void removeFromCart(String productId, {String? variant}) {
    _cartItems.removeWhere(
      (item) => item.productId == productId && item.variant == variant,
    );
    _cartController.add(List.from(_cartItems));
  }

  void updateQuantity(String productId, int quantity, {String? variant}) {
    final itemIndex = _cartItems.indexWhere(
      (item) => item.productId == productId && item.variant == variant,
    );

    if (itemIndex != -1) {
      if (quantity <= 0) {
        _cartItems.removeAt(itemIndex);
      } else {
        _cartItems[itemIndex] = CartItem(
          productId: _cartItems[itemIndex].productId,
          productName: _cartItems[itemIndex].productName,
          productImage: _cartItems[itemIndex].productImage,
          price: _cartItems[itemIndex].price,
          quantity: quantity,
          variant: _cartItems[itemIndex].variant,
        );
      }
    }
    _cartController.add(List.from(_cartItems));
  }

  void clearCart() {
    _cartItems.clear();
    _cartController.add(List.from(_cartItems));
  }

  bool isInCart(String productId, {String? variant}) {
    return _cartItems.any(
      (item) => item.productId == productId && item.variant == variant,
    );
  }

  int getItemQuantity(String productId, {String? variant}) {
    final item = _cartItems.firstWhere(
      (item) => item.productId == productId && item.variant == variant,
      orElse: () => CartItem(
        productId: '',
        productName: '',
        productImage: '',
        price: 0,
        quantity: 0,
      ),
    );
    return item.quantity;
  }

  void dispose() {
    _cartController.close();
  }
}
