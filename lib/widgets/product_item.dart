import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_details_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product prod = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen:false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: prod.id,
            );
          },
          child: Image.network(
            prod.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (c, prod, _) => IconButton(
              icon: Icon(
                prod.isFavourite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                prod.toggleFavouriteState();
              },
            ),
          ),
          title: Text(
            prod.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(prod.id, prod.price, prod.title);
            },
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
