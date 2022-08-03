import 'package:flutter/material.dart';
import 'package:lojamodel/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Bem vindo Usuário!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text(
            'Loja',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Pedidos', style: TextStyle(color: Colors.grey)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title:
              Text('Gerenciar Produtos', style: TextStyle(color: Colors.grey)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
          },
        ),
        Divider(),
      ],
    ));
  }
}
