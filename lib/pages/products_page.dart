import 'package:flutter/material.dart';
import 'package:lojamodel/components/app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
      ),
      drawer: AppDrawer(),
    );
  }
}
