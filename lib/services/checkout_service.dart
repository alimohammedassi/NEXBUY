import 'package:flutter/material.dart';
import '../models/user.dart';
import 'user_service.dart';

class CheckoutService {
  static final CheckoutService _instance = CheckoutService._internal();
  factory CheckoutService() => _instance;
  CheckoutService._internal();

  final UserService _userService = UserService();

  Future<String?> processCheckout({
    required List<CartItem> items,
    required Address shippingAddress,
    required PaymentMethod paymentMethod,
    String? notes,
  }) async {
    try {
      // Calculate total
      double totalAmount = 0;
      for (var item in items) {
        totalAmount += item.price * item.quantity;
      }

      // Create order
      final order = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        orderNumber: '', // Will be set by UserService
        items: items
            .map(
              (item) => OrderItem(
                id:
                    DateTime.now().millisecondsSinceEpoch.toString() +
                    '_${item.productId}',
                productId: item.productId,
                productName: item.productName,
                productImage: item.productImage,
                price: item.price,
                quantity: item.quantity,
                variant: item.variant,
              ),
            )
            .toList(),
        totalAmount: totalAmount,
        status: OrderStatus.pending,
        shippingAddress: shippingAddress,
        orderDate: DateTime.now(),
        notes: notes,
      );

      // Save order
      final orderNumber = await _userService.createOrder(order);

      // Send confirmation notification
   

      return orderNumber;
    } catch (e) {
      debugPrint('Checkout error: $e');
      return null;
    }
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      final success = await _userService.updateOrderStatus(orderId, newStatus);

      if (success) {
        final order = _userService.getOrderById(orderId);
        if (order != null) {
          // Send appropriate notification based on status
          switch (newStatus) {
            case OrderStatus.shipped:
              if (order.trackingNumber != null) {
              
              }
              break;
            case OrderStatus.delivered:
            
            case OrderStatus.cancelled:
          
            default:
              break;
          }
        }
      }

      return success;
    } catch (e) {
      debugPrint('Update order status error: $e');
      return false;
    }
  }

  Future<bool> addTrackingNumber(String orderId, String trackingNumber) async {
    try {
      final order = _userService.getOrderById(orderId);
      if (order == null) return false;

      final updatedOrder = order.copyWith(trackingNumber: trackingNumber);
      return await _userService.updateOrderStatus(orderId, updatedOrder.status);
    } catch (e) {
      debugPrint('Add tracking number error: $e');
      return false;
    }
  }
}

class CartItem {
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final String? variant;

  CartItem({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    this.variant,
  });
}

enum PaymentMethod {
  creditCard,
  debitCard,
  paypal,
  applePay,
  googlePay,
  bankTransfer,
}

extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.applePay:
        return 'Apple Pay';
      case PaymentMethod.googlePay:
        return 'Google Pay';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
    }
  }

  String get icon {
    switch (this) {
      case PaymentMethod.creditCard:
        return '💳';
      case PaymentMethod.debitCard:
        return '💳';
      case PaymentMethod.paypal:
        return '🅿️';
      case PaymentMethod.applePay:
        return '🍎';
      case PaymentMethod.googlePay:
        return '🅶';
      case PaymentMethod.bankTransfer:
        return '🏦';
    }
  }
}
