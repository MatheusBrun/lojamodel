import 'package:flutter/material.dart';
import 'package:lojamodel/models/product.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Tem Certeza?'),
                  content: Text(
                    'Quer remover o item ${cartItem.name} ?',
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text('Não'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text('Sim'),
                    ),
                  ],
                ));
      },
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '${cartItem.price}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              cartItem.name,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}',
                style: TextStyle(color: Colors.black)),
            trailing: Text('${cartItem.quantity}x',
                style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
