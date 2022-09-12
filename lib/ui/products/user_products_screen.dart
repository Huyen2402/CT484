import 'package:flutter/material.dart';
import 'user_products_list_tile.dart';
import 'products_manager.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager = ProductManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => print('Refresh product'),
        child: buildUserProductListView(productManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductManager productManager){
    return ListView.builder(
      itemCount: productManager.itemcount,
      itemBuilder: (context, index) => Column(
        children: [
          UserProductListTile(
            productManager.items[index],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton(){
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        
        print('Go to edit product screen');
      },
    );
  }
}