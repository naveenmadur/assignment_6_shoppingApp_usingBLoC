import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
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
            margin: const EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.4,
            child: const Image(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/03/26/88/032688086182d7bd44a8e76327ca5b70.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Shopping',
              style: kTitleTextStyle,
            ),
            onTap: () {
              BlocProvider.of<ProductsBloc>(context).add(NavigateToHomeEvent());
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              'Cart',
              style: kTitleTextStyle,
            ),
            onTap: () {
              BlocProvider.of<ProductsBloc>(context)
                  .add(NavigateToCartScreenEvent());
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
          ),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              'Orders',
              style: kTitleTextStyle,
            ),
            onTap: () {
              BlocProvider.of<ProductsBloc>(context)
                  .add(NavigateToOrdersScreen());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrdersScreen()));
            },
          )
        ],
      ),
    );
  }
}
