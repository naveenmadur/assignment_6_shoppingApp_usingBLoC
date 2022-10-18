import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/constants.dart';
import '../bloc/products_bloc.dart';
import 'home_screen.dart';
import 'orders_screen.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                        if (isEmpty) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                        if (!isEmpty) {
                          BlocProvider.of<ProductsBloc>(context)
                              .add(AddToOrdersEvent(orders: state.cart));
                          BlocProvider.of<ProductsBloc>(context)
                              .add(BuyEvent());
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const OrdersScreen()));
                        }
                      },
                      child: Container(
                        margin: kCartScreenBuyButtonMargin,
                        color: kGreenAccent,
                        padding: kCartScreenBuyButtonPadding,
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