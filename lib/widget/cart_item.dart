import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/lanproviders.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;

  const CartItem(
      this.id,
      this.productId,
      this.price,
      this.quantity,
      this.title
      );


  @override
  Widget build(BuildContext context) {
    var lan=Provider.of<LanguageProvider>(context,listen: true);

    return Directionality(
      textDirection: lan.isEn? TextDirection.ltr:TextDirection.rtl,
      child: Dismissible(
          key: ValueKey(id),
          background: Container(
            color: Theme.of(context).errorColor,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(title:Text(lan.getTexts('Are you sure?')),
                content: Text(lan.getTexts('Do you want to remove item from the cart?')),
                actions: [
                  FlatButton( child: Text(lan.getTexts('No!')),
                    onPressed: ()=>Navigator.of(context).pop(),
                  ),
                  FlatButton( child: Text(lan.getTexts('Yes')),
                    onPressed: ()=>Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction){
            Provider.of<cart>(context,listen: false).removitem(productId);
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text('\$$price'),
                    ),
                  ),
                ),
                title: Text(title),
                subtitle: Text('Total \$${(price * quantity)}'),
                trailing: Text('$quantity x'),
              ),
            ),
          )),
    );
  }
}
