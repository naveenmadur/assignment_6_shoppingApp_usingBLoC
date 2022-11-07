import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/router/app_router.gr.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/text_constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
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
                    router.replace(const HomeScreenRoute());
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => const HomeScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: kDrawerCartText,
                  onTap: () {
                    router.replace(const CartScreenRoute());
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const CartScreen()));
                  },
                ),
                kDivider,
                ListTile(
                  leading: const Icon(Icons.history),
                  title: kDrawerOrderText,
                  onTap: () {
                    router.replace(const OrdersScreenRoute());
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const OrdersScreen()));
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
