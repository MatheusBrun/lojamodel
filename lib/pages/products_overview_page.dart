import 'package:flutter/material.dart';
import 'package:lojamodel/components/badge.dart';
import 'package:lojamodel/models/cart.dart';
import 'package:provider/provider.dart';
import '../components/product_grid.dart';
import '../components/badge.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Minha Loja',
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text(
                    'Somente Favoritos',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('Todos', style: TextStyle(color: Colors.black)),
                  value: FilterOptions.All,
                ),
              ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
            ),
            Consumer<Cart>(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
              builder: (ctx, cart, child) => Badge(
                value: cart.itemsCount.toString(),
                child: child!,
              ),
            )
          ],
        ),
        body: ProductGrid(_showFavoriteOnly));
  }
}
