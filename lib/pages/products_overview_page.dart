import 'package:flutter/material.dart';

import '../components/product_grid.dart';


class ProductsOverviewPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Minha Loja',
          ),
        ),
        body: ProductGrid());
  }
}

