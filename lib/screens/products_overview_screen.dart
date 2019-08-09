import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProducsOverviewScreen extends StatefulWidget {
  @override
  _ProducsOverviewScreenState createState() => _ProducsOverviewScreenState();
}

class _ProducsOverviewScreenState extends State<ProducsOverviewScreen> {
  bool _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop Overview'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOption _selectedValue) {
              setState(() {
                if (_selectedValue == FilterOption.Favorites) {
                  _showFavouritesOnly = true;
                } else {
                  _showFavouritesOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOption.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOption.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, staticChild) => Badge(
              child: staticChild,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ), 
          ),
        ],
      ),
      body: ProductsGrid(_showFavouritesOnly),
    );
    return scaffold;
  }
}
