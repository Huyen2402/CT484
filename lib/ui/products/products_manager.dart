import '../../model/product.dart';

class ProductManager{
  final List<Product> _items = [
    Product(id: '1',title: 'Áo thun', description: 'Đẹp lắm mua đi', price: 50000, imageUrl: 'assets/goods_00_434247.jpg'),
    Product(id: '2',title: 'Áo polo', description: 'Đẹp lắm mua đi', price: 70000, imageUrl: 'assets/goods_00_434247.jpg'),
    Product(id: '3',title: 'Áo marvel', description: 'Đẹp lắm mua đi', price: 90000, imageUrl: 'assets/goods_00_434247.jpg')
  ];

  int get itemcount {
    return _items.length;
  }

  List<Product> get items {
    return _items;
  }

  List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
}