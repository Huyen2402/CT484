import 'package:flutter/material.dart';

import 'ui/screens.dart';

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
      home: const ProductOverviewScreen(),
      routes: {
        CartScreen.routeName:(context) => const CartScreen(),
        OrdersScreen.routeName:(context) => const OrdersScreen(),
        UserProductScreen.routeName:(context) => const UserProductScreen()
      },
      onGenerateRoute: (settings) {
        if(settings.name == ProductDetailScreen.routeName){
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(ProductManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
