import 'package:flutter/material.dart';
import '../components/product_grid.dart';

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
          ],
        ),
        body: ProductGrid(_showFavoriteOnly));
  }
}
