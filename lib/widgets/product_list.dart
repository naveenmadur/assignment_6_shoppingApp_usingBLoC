import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is InitialState) {
          BlocProvider.of<ProductsBloc>(context).add(GetProductsEvent());
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProductsState) {
          return const ProductCard();
        } else {
          return const ProductCard();
        }
      },
    );
  }
}
