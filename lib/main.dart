import 'package:flutter/material.dart';
import 'ui/products/products_detail_screen.dart';
import 'ui/products/products_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        
      ),
      home: SafeArea(
        child: ProductDetailScreen(
          ProductManager().items[0],
        ),
        ),
    );
  }
}
