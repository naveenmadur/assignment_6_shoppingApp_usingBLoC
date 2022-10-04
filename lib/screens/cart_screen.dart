import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/screens/home_screen.dart';
import 'package:shopping_app_using_bloc/screens/orders_screen.dart';
import 'package:shopping_app_using_bloc/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: kAppBarIconThemeData,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Cart',
          style: kTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsState) {
            final bool isEmpty = state.cart.isEmpty;
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isEmpty ? const Spacer() : const Text(''),
                    isEmpty
                        ? const Text(
                            'Add some Items first',
                            style: kPriceTextStyle,
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) =>
                                  CartItem(product: state.cart[index]),
                              itemCount: state.cart.length,
                            ),
                          ),
                    isEmpty ? const Spacer() : const Text(''),
                    GestureDetector(
                      onTap: () {
                        isEmpty ? null : BlocProvider.of<ProductsBloc>(context).add(AddToOrdersEvent(orders: state.cart));
                        isEmpty
                            ? BlocProvider.of<ProductsBloc>(context)
                                .add(NavigateToHomeEvent())
                            : BlocProvider.of<ProductsBloc>(context)
                                .add(NavigateToOrdersScreen());
                        isEmpty
                            ? Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()))
                            : Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const OrdersScreen()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        color: kGreenAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 160, vertical: 15),
                        child: const Text('BUY'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
