import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/screens/cart_screen.dart';
import 'package:shopping_app_using_bloc/widgets/badge.dart';
import 'package:shopping_app_using_bloc/widgets/drawer.dart';
import 'package:shopping_app_using_bloc/widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            color: kGrey,
          );
        }),
        backgroundColor: kBackgroundColor,
        title: const Text(
          'SHOPPING',
          style: kTitleTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: kGrey,
            onPressed: () {},
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is GetProductsState) {
                return Badge(
                    value: state.cart.length.toString(),
                    color: kGreenAccent,
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ProductsBloc>(context)
                            .add(NavigateToCartScreenEvent());
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartScreen()));
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: kGrey,
                    ));
              }
              return const Badge(
                  value: '0',
                  color: kGreenAccent,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.shopping_cart),
                    color: kGrey,
                  ));
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        color: kBackgroundColor,
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Fashion',
                    style: TextStyle(fontSize: 25),
                  )),
              const ProductList(),
            ]),
      ),
    );
  }
}
