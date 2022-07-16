import 'package:flutter/material.dart';
import 'package:lojamodel/components/product_item.dart';
import 'package:lojamodel/data/dummy_data.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/product_list.dart';

class ProductsOverviewPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Minha Loja',
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ));
  }
}
