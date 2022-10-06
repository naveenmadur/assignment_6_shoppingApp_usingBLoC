import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/constants/text_constants.dart';
import 'package:shopping_app_using_bloc/screens/cart_screen.dart';
import 'package:shopping_app_using_bloc/screens/home_screen.dart';
import 'package:shopping_app_using_bloc/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            margin: kDrawerMargin,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.4,
            child: kDrawerImage,
          ),
          Container(
            padding: kAppDrawerPadding,
            child: Column(
              children: [
                ListTile(
                  leading: kHomeIcon,
                  title: kDrawerShoppingText,
                  onTap: () {
                    BlocProvider.of<ProductsBloc>(context)
                        .add(NavigateToHomeEvent());
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: kDrawerCartText,
                  onTap: () {
                    BlocProvider.of<ProductsBloc>(context)
                        .add(NavigateToCartScreenEvent());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.history),
                  title: kDrawerOrderText,
                  onTap: () {
                    BlocProvider.of<ProductsBloc>(context)
                        .add(NavigateToOrdersScreenEvent());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrdersScreen()));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
