import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/constants.dart';
import '../../domain/entities/product_entity.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: kCartItemMargin,
      elevation: 0,
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width / 7,
          child: Image(
            image: NetworkImage(product.imageUrl.toString()),
            fit: BoxFit.contain,
          ),
        ),
        title: Text(product.title!,
            maxLines: 1, softWrap: true, overflow: TextOverflow.ellipsis, style: kCartTitleTextStyle,),
        subtitle: Text('x ${product.quantity.toString()}'),
        trailing: Container(
          decoration: BoxDecoration(border: Border.all(color: kGreenAccent)),
          padding: kCartItemPricePadding,
          child: Text('\$ ${(product.price!).toString()}'),
        ),
      ),
    );
  }
}
