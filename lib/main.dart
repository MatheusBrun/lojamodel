import 'package:flutter/material.dart';
import 'package:lojamodel/pages/products_overview_page.dart';
import 'pages/products_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ThemeData theme = ThemeData();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.red, secondary: Colors.deepOrange),
        textTheme: const TextTheme(
          headline6: TextStyle(fontFamily: 'Lato'),
        ),
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
