import 'package:flutter/material.dart';
import 'package:lojamodel/models/product_list.dart';
import 'package:lojamodel/pages/product_detail_page.dart';
import 'package:lojamodel/pages/products_overview_page.dart';
import 'package:lojamodel/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'pages/products_overview_page.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.red, secondary: Colors.deepOrange),
          textTheme: const TextTheme(
            headline6: TextStyle(fontFamily: 'Lato'),
          ),
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
