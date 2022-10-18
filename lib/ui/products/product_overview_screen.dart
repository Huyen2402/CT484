import 'package:flutter/material.dart';
import 'package:myshop/ui/cart/cart_manager.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/share/app_drawer.dart';
import 'package:provider/provider.dart';
import 'product_grid.dart';
import 'top_right_badge.dart';


enum FilterOptions {favorites , all}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreen();
}

class _ProductOverviewScreen extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(_showOnlyFavorite),
    );
  }

  Widget buildShoppingCartIcon(){
    return Consumer<CartManager>(
     builder: (context, cartManager, child)  {
      return TopRightBadge(
      data: cartManager.productCount,
      child: IconButton(icon: const Icon(Icons.shopping_cart),
      onPressed: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
      },),
      
    );
     });
  }

  Widget buildProductFilterMenu(){
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue){
        setState(() {
          if(selectedValue == FilterOptions.favorites){
            _showOnlyFavorite = true;

          }else{
            _showOnlyFavorite = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorite'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show all'),
        )
      ],
    );
  }
}