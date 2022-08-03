import 'package:flutter/material.dart';
import 'package:lojamodel/models/order_list.dart';
import 'package:lojamodel/models/product_list.dart';
import 'package:lojamodel/pages/cart_page.dart';
import 'package:lojamodel/pages/orders_page.dart';
import 'package:lojamodel/pages/product_detail_page.dart';
import 'package:lojamodel/pages/products_overview_page.dart';
import 'package:lojamodel/pages/products_page.dart';
import 'package:lojamodel/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              primary: Colors.deepOrangeAccent, secondary: Colors.red),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black),
            headline6: TextStyle(fontFamily: 'Lato', color: Colors.black),
          ),
        ),
        //home: ProductsOverviewPage(),
        routes: {
          AppRoutes.HOME: (ctx) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
