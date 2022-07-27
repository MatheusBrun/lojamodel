import 'package:flutter/material.dart';
import 'package:lojamodel/models/product_list.dart';
import 'package:provider/provider.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
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
                if (selectedValue == FilterOptions.Favorite) {
                  provider.showFavoriteOnly();
                } else {
                  provider.showAll();
                }
              },
            ),
          ],
        ),
        body: ProductGrid());
  }
}
