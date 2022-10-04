import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Image(
              image: NetworkImage('https://i.pinimg.com/originals/03/26/88/032688086182d7bd44a8e76327ca5b70.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Shopping',
              style: ktitleTextStyle,
            ),
            onTap: () {},
          ),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              'Cart',
              style: ktitleTextStyle,
            ),
            onTap: () {},
          ),
          const Divider(
            thickness: 3,
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              'Orders',
              style: ktitleTextStyle,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
