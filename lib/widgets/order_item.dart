import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    
    final month = DateFormat.MMM().format(DateTime.now());
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width / 7,
          child: Image(
            image: NetworkImage(product.imageUrl.toString()),
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          'Purchased on $month',
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: kOrderTitleTextStyle,
        ),
        subtitle: Text(
          product.title!,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          decoration: BoxDecoration(border: Border.all(color: kGreenAccent)),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text('\$ ${(product.price!).toString()}'),
        ),
      ),
    );
  }
}
