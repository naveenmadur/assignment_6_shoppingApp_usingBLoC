import 'package:flutter/material.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/text_constants.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/orders_screen.dart';

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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: kDrawerCartText,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.history),
                  title: kDrawerOrderText,
                  onTap: () {
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
