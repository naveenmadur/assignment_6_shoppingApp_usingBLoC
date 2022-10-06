import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:shopping_app_using_bloc/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: kAppBarIconThemeData,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Orders',
          style: kTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsState) {
            final bool isEmpty = state.orders.isEmpty;
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      isEmpty ? const Spacer() : const Text(''),
                      isEmpty
                          ? const Text(
                              'No purchase history available',
                              style: kPriceTextStyle,
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) =>
                                    OrderItem(product: state.orders[index]),
                                itemCount: state.orders.length,
                              ),
                            ),
                      isEmpty ? const Spacer() : const Text(''),
                    ],
                  ),
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
    ;
  }
}
