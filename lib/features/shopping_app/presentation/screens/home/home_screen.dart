import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/router/app_router.gr.dart';
import '../../../../../constants/color_constants.dart';
import '../../../../../constants/constants.dart';
import '../../../../../constants/text_constants.dart';
import '../../bloc/products_bloc.dart';
import '../../widgets/badge.dart';
import '../../widgets/drawer.dart';
import '../../widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
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
        title: kHomeScreenAppBarText,
        actions: [
          IconButton(
            icon: kSearchIcon,
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
                        router.push(const CartScreenRoute());
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const CartScreen()));
                      },
                      icon: const Icon(Icons.shopping_cart),
                      color: kGrey,
                    ));
              }
              return const Text('');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Container(
        color: kBackgroundColor,
        padding: kHomeScreenBodyPadding,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: kHomeScreenHeadingText),
              const ProductList(),
            ]),
      ),
    );
  }
}
