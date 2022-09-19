import 'package:flutter/material.dart';
import 'package:myshop/ui/share/app_drawer.dart';

import 'order_item_card.dart';
import 'order_manager.dart';
class OrdersScreen extends StatelessWidget {
   static const routeName = '/order';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building orders');
    final orderManager = OderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderManager.orderCount,
        itemBuilder: (context, index) => OrderItemCard(orderManager.orders[index]),
      ),
    );
  }
}