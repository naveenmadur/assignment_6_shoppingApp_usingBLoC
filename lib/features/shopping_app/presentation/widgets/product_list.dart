import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/bloc/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/product_card.dart';


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
