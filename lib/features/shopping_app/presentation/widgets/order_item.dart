import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/constants.dart';
import '../../domain/entities/product_entity.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;

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
          padding: kOrderItemPricePadding,
          child: Text('\$ ${(product.price!).toString()}'),
        ),
      ),
    );
  }
}
