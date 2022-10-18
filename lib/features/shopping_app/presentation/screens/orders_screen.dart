import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/text_constants.dart';
import '../bloc/products_bloc.dart';
import '../widgets/order_item.dart';


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
        title: kOrdersScreenAppBarText,
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsState) {
            final bool isEmpty = state.orders.isEmpty;
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: kOrdersScreenBodyPadding,
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
  }
}
