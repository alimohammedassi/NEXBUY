import '../models/user.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  User? _currentUser;
  List<Order> _orders = [];

  User? get currentUser => _currentUser;
  List<Order> get orders => _orders;

  // Initialize with sample data
  void initialize() {
    _currentUser = User(
      id: '1',
      name: 'Alex Johnson',
      email: 'alex.johnson@email.com',
      phone: '+1 (555) 123-4567',
      profileImage: null,
      addresses: [
        Address(
          id: '1',
          title: 'Home',
          fullAddress: '123 Main Street, New York, NY 10001',
          latitude: 40.7128,
          longitude: -74.0060,
          city: 'New York',
          state: 'NY',
          zipCode: '10001',
          country: 'USA',
          isDefault: true,
        ),
        Address(
          id: '2',
          title: 'Office',
          fullAddress: '456 Business Ave, New York, NY 10002',
          latitude: 40.7589,
          longitude: -73.9851,
          city: 'New York',
          state: 'NY',
          zipCode: '10002',
          country: 'USA',
          isDefault: false,
        ),
      ],
      orders: [],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
    );

    // Sample orders
    _orders = [
      Order(
        id: '1',
        orderNumber: 'NEX-2024-001',
        items: [
          OrderItem(
            id: '1',
            productId: '1',
            productName: 'MacBook Pro 16"',
            productImage:
                'images/Apple_2023_Newest_MacBook_Pro_MR7J3_Laptop_M3_chip.jpg',
            price: 2499.00,
            quantity: 1,
          ),
        ],
        totalAmount: 2499.00,
        status: OrderStatus.delivered,
        shippingAddress: _currentUser!.addresses.first,
        orderDate: DateTime.now().subtract(const Duration(days: 15)),
        deliveryDate: DateTime.now().subtract(const Duration(days: 10)),
        trackingNumber: 'TRK123456789',
      ),
      Order(
        id: '2',
        orderNumber: 'NEX-2024-002',
        items: [
          OrderItem(
            id: '2',
            productId: '2',
            productName: 'MacBook Air 15"',
            productImage:
                'images/Apple_New_2025_MacBook_Air_MC6T4_13-Inch_Display_A.jpg',
            price: 1299.00,
            quantity: 1,
          ),
        ],
        totalAmount: 1299.00,
        status: OrderStatus.shipped,
        shippingAddress: _currentUser!.addresses.first,
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        trackingNumber: 'TRK987654321',
      ),
      Order(
        id: '3',
        orderNumber: 'NEX-2024-003',
        items: [
          OrderItem(
            id: '3',
            productId: '3',
            productName: 'Dell XPS 13',
            productImage:
                'images/DELL_Vostro_3530_Laptop_With_156_Inch_Full_HD_1920.jpg',
            price: 1299.00,
            quantity: 1,
          ),
        ],
        totalAmount: 1299.00,
        status: OrderStatus.processing,
        shippingAddress: _currentUser!.addresses.first,
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  Future<bool> updateUserName(String newName) async {
    if (_currentUser == null) return false;

    _currentUser = _currentUser!.copyWith(
      name: newName,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> updateUserEmail(String newEmail) async {
    if (_currentUser == null) return false;

    _currentUser = _currentUser!.copyWith(
      email: newEmail,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> updateUserPhone(String newPhone) async {
    if (_currentUser == null) return false;

    _currentUser = _currentUser!.copyWith(
      phone: newPhone,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> addAddress(Address address) async {
    if (_currentUser == null) return false;

    final updatedAddresses = List<Address>.from(_currentUser!.addresses);
    updatedAddresses.add(address);

    _currentUser = _currentUser!.copyWith(
      addresses: updatedAddresses,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> updateAddress(String addressId, Address updatedAddress) async {
    if (_currentUser == null) return false;

    final updatedAddresses = _currentUser!.addresses.map((addr) {
      return addr.id == addressId ? updatedAddress : addr;
    }).toList();

    _currentUser = _currentUser!.copyWith(
      addresses: updatedAddresses,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> deleteAddress(String addressId) async {
    if (_currentUser == null) return false;

    final updatedAddresses = _currentUser!.addresses
        .where((addr) => addr.id != addressId)
        .toList();

    _currentUser = _currentUser!.copyWith(
      addresses: updatedAddresses,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<bool> setDefaultAddress(String addressId) async {
    if (_currentUser == null) return false;

    final updatedAddresses = _currentUser!.addresses.map((addr) {
      return addr.copyWith(isDefault: addr.id == addressId);
    }).toList();

    _currentUser = _currentUser!.copyWith(
      addresses: updatedAddresses,
      updatedAt: DateTime.now(),
    );
    return true;
  }

  Future<String> createOrder(Order order) async {
    final orderNumber = 'NEX-${DateTime.now().year}-${_orders.length + 1}';
    final newOrder = order.copyWith(
      orderNumber: orderNumber,
      orderDate: DateTime.now(),
    );

    _orders.insert(0, newOrder);

    // Update user's orders
    if (_currentUser != null) {
      final updatedOrders = List<Order>.from(_currentUser!.orders);
      updatedOrders.insert(0, newOrder);

      _currentUser = _currentUser!.copyWith(
        orders: updatedOrders,
        updatedAt: DateTime.now(),
      );
    }

    return orderNumber;
  }

  Future<bool> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    final orderIndex = _orders.indexWhere((order) => order.id == orderId);
    if (orderIndex == -1) return false;

    final updatedOrder = _orders[orderIndex].copyWith(status: newStatus);
    _orders[orderIndex] = updatedOrder;

    // Update user's orders
    if (_currentUser != null) {
      final updatedOrders = _currentUser!.orders.map((order) {
        return order.id == orderId ? updatedOrder : order;
      }).toList();

      _currentUser = _currentUser!.copyWith(
        orders: updatedOrders,
        updatedAt: DateTime.now(),
      );
    }

    return true;
  }

  Order? getOrderById(String orderId) {
    try {
      return _orders.firstWhere((order) => order.id == orderId);
    } catch (e) {
      return null;
    }
  }

  Order? getOrderByNumber(String orderNumber) {
    try {
      return _orders.firstWhere((order) => order.orderNumber == orderNumber);
    } catch (e) {
      return null;
    }
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return _orders.where((order) => order.status == status).toList();
  }
}
