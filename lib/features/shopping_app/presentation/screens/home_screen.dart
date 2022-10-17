import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/constants/text_constants.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/cart_screen.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/badge.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/drawer.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context)
        .add(LoadCartFromSharedPreferenceEvent());
    BlocProvider.of<ProductsBloc>(context)
        .add(LoadOrdersFromSharedPreferenceEvent());
    super.initState();
  }

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
                        BlocProvider.of<ProductsBloc>(context)
                            .add(NavigateToCartScreenEvent());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CartScreen()));
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
