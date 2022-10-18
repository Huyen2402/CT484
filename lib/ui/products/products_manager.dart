import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../model/product.dart';

class ProductManager with ChangeNotifier{
  final List<Product> _items = [
    Product(id: '1',title: 'Áo thun', description: 'Đẹp lắm mua đi', price: 50000, imageUrl: 'assets/CDL10_1.jpg'),
    Product(id: '2',title: 'Áo polo', description: 'Đẹp lắm mua đi', price: 70000, imageUrl: 'assets/goods_00_434247.jpg'),
    Product(id: '3',title: 'Áo marvel', description: 'Đẹp lắm mua đi', price: 90000, imageUrl: 'assets/an-pie0242(t)_1.jpg')
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

  Product findById(String id){
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product){
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }
  void updateProduct(Product product){
    final index= _items.indexWhere((item) => item.id == product.id);
    if(index >=0){
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product){
    final saveStatus = product.isFavorite;
    product.isFavorite = !saveStatus;
  }

  void deleteProduct(String id){
 final index= _items.indexWhere((item) => item.id == id);
 _items.removeAt(index);
 notifyListeners();
  }
}