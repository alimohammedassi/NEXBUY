import '../models/product.dart';

class ProductProvider {
  static final List<Product> _laptops = [
    Product(
      id: '1',
      name: 'MacBook Pro 16"',
      description: 'Apple M3 Pro chip with 12-core CPU and 19-core GPU',
      price: 2499.00,
      rating: 4.8,
      imagePath:
          'images/Apple_2023_Newest_MacBook_Pro_MR7J3_Laptop_M3_chip.jpg',
      category: 'Laptops',
      isFavorite: false,
      features: ['M3 Pro Chip', '16GB RAM', '512GB SSD', '16.2" Display'],
      brand: 'Apple',
      model: 'MacBook Pro 16"',
      specifications: {
        'Processor': 'Apple M3 Pro',
        'Memory': '16GB Unified Memory',
        'Storage': '512GB SSD',
        'Display': '16.2" Liquid Retina XDR',
        'Graphics': '19-core GPU',
      },
    ),
    Product(
      id: '2',
      name: 'MacBook Air 15"',
      description: 'Apple M2 chip with 8-core CPU and 10-core GPU',
      price: 1299.00,
      rating: 4.7,
      imagePath:
          'images/Apple_New_2025_MacBook_Air_MC6T4_13-Inch_Display_A.jpg',
      category: 'Laptops',
      isFavorite: true,
      features: ['M2 Chip', '8GB RAM', '256GB SSD', '15.3" Display'],
      brand: 'Apple',
      model: 'MacBook Air 15"',
      specifications: {
        'Processor': 'Apple M2',
        'Memory': '8GB Unified Memory',
        'Storage': '256GB SSD',
        'Display': '15.3" Liquid Retina',
        'Graphics': '10-core GPU',
      },
    ),
    Product(
      id: '3',
      name: 'Dell XPS 13',
      description: '13th Gen Intel Core i7 with 16GB RAM and 512GB SSD',
      price: 1299.00,
      rating: 4.6,
      imagePath:
          'images/DELL_Vostro_3530_Laptop_With_156_Inch_Full_HD_1920.jpg',
      category: 'Laptops',
      isFavorite: false,
      features: ['Intel i7', '16GB RAM', '512GB SSD', '13.4" 4K Display'],
      brand: 'Dell',
      model: 'XPS 13',
      specifications: {
        'Processor': 'Intel Core i7-1360P',
        'Memory': '16GB LPDDR5',
        'Storage': '512GB PCIe SSD',
        'Display': '13.4" 4K UHD+',
        'Graphics': 'Intel Iris Xe',
      },
    ),
    Product(
      id: '4',
      name: 'HP Spectre x360',
      description: '2-in-1 laptop with Intel i7 and 16GB RAM',
      price: 1199.00,
      rating: 4.5,
      imagePath:
          'images/HP_Upgraded_Version_OmniBook_5_Flip_Personal_Lapto.jpg',
      category: 'Laptops',
      isFavorite: true,
      features: ['2-in-1 Design', 'Intel i7', '16GB RAM', '512GB SSD'],
      brand: 'HP',
      model: 'Spectre x360',
      specifications: {
        'Processor': 'Intel Core i7-1355U',
        'Memory': '16GB LPDDR5',
        'Storage': '512GB PCIe SSD',
        'Display': '13.5" 3K2K OLED',
        'Graphics': 'Intel Iris Xe',
      },
    ),
    Product(
      id: '5',
      name: 'Lenovo ThinkPad X1',
      description: 'Business laptop with Intel i7 and 32GB RAM',
      price: 1899.00,
      rating: 4.7,
      imagePath:
          'images/Lenovo_IDEAPAD_5_2_IN_1_-83DT008YED-Intel_Core_7_1.jpg',
      category: 'Laptops',
      isFavorite: false,
      features: ['Business Grade', 'Intel i7', '32GB RAM', '1TB SSD'],
      brand: 'Lenovo',
      model: 'ThinkPad X1 Carbon',
      specifications: {
        'Processor': 'Intel Core i7-1365U',
        'Memory': '32GB LPDDR5',
        'Storage': '1TB PCIe SSD',
        'Display': '14" WUXGA IPS',
        'Graphics': 'Intel Iris Xe',
      },
    ),
    Product(
      id: '6',
      name: 'ASUS ROG Zephyrus',
      description: 'Gaming laptop with RTX 4070 and AMD Ryzen 9',
      price: 2199.00,
      rating: 4.9,
      imagePath:
          'images/ASUS_ASUS_TUF_Gaming_A14_FA401UU-RG028W_Gaming_Lap.jpg',
      category: 'Laptops',
      isFavorite: true,
      features: ['Gaming Laptop', 'RTX 4070', 'AMD Ryzen 9', '32GB RAM'],
      brand: 'ASUS',
      model: 'ROG Zephyrus G14',
      specifications: {
        'Processor': 'AMD Ryzen 9 7940HS',
        'Memory': '32GB DDR5',
        'Storage': '1TB PCIe SSD',
        'Display': '14" QHD 165Hz',
        'Graphics': 'NVIDIA RTX 4070',
      },
    ),
    Product(
      id: '7',
      name: 'Surface Laptop 5',
      description: 'Microsoft Surface with Intel i7 and 16GB RAM',
      price: 1399.00,
      rating: 4.4,
      imagePath:
          'images/Honor_MagicBook_Art_14_Laptop_With_146-Inch_Full_H.jpg',
      category: 'Laptops',
      isFavorite: false,
      features: ['Microsoft Surface', 'Intel i7', '16GB RAM', '512GB SSD'],
      brand: 'Microsoft',
      model: 'Surface Laptop 5',
      specifications: {
        'Processor': 'Intel Core i7-1255U',
        'Memory': '16GB LPDDR5',
        'Storage': '512GB PCIe SSD',
        'Display': '13.5" PixelSense',
        'Graphics': 'Intel Iris Xe',
      },
    ),
    Product(
      id: '8',
      name: 'Razer Blade 15',
      description: 'Gaming laptop with RTX 4060 and Intel i7',
      price: 1999.00,
      rating: 4.6,
      imagePath: 'images/ASUS_Upgraded_Version_Lenovo_LOQ_15IRX9_Gaming_L.jpg',
      category: 'Laptops',
      isFavorite: true,
      features: ['Gaming Laptop', 'RTX 4060', 'Intel i7', '16GB RAM'],
      brand: 'Razer',
      model: 'Blade 15',
      specifications: {
        'Processor': 'Intel Core i7-13700H',
        'Memory': '16GB DDR5',
        'Storage': '1TB PCIe SSD',
        'Display': '15.6" QHD 240Hz',
        'Graphics': 'NVIDIA RTX 4060',
      },
    ),
  ];

  static List<Product> get laptops => _laptops;

  static List<Product> get featuredLaptops => _laptops.take(4).toList();

  static List<Product> get favoriteLaptops =>
      _laptops.where((laptop) => laptop.isFavorite).toList();

  static Product? getLaptopById(String id) {
    try {
      return _laptops.firstWhere((laptop) => laptop.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<Product> searchLaptops(String query) {
    if (query.isEmpty) return _laptops;

    return _laptops.where((laptop) {
      return laptop.name.toLowerCase().contains(query.toLowerCase()) ||
          laptop.brand.toLowerCase().contains(query.toLowerCase()) ||
          laptop.model.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
