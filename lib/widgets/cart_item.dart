import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
      elevation: 0,
      child: ListTile(
        leading: Container(
          width: MediaQuery.of(context).size.width / 7,
          child: Image(
            image: NetworkImage(product.imageUrl.toString()),
            fit: BoxFit.contain,
          ),
        ),
        title: Text(product.title!,
            maxLines: 1, softWrap: true, overflow: TextOverflow.ellipsis),
        subtitle: Text('x ${product.quantity.toString()}'),
        trailing: Container(
          decoration: BoxDecoration(border: Border.all(color: kgreenAccent)),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text('\$ ${(product.price! * product.quantity).toString()}'),
        ),
      ),
    );
  }
}
