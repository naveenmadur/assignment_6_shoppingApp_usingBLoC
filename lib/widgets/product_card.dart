import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_using_bloc/preferences/cart_shared_preference.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List<String> localCartList = [];
  List<ProductModel> loadedCartProducts = [];

  @override
  void initState() {
    // _init();
    super.initState();
  }

  // void storeData(ProductModel product) {
  //   ProductModel prod = ProductModel(
  //       id: product.id,
  //       title: product.title,
  //       imageUrl: product.imageUrl,
  //       quantity: product.quantity,
  //       price: product.price,
  //       );
  //       String encodedProd = jsonEncode(prod);
  //       print(encodedProd);
  //       localCartList.add(encodedProd);
  // print(localCartList);
  //     _sharedPreferences.setStringList('localCart', localCartList);
  // }

  // void _init() async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   List<String>? loadedList = _sharedPreferences.getStringList('localCart');
  //   if(!(loadedList == null)){
  //   for(int i=0; i<loadedList.length; i++){
  //     ProductModel prod = ProductModel.fromJson(jsonDecode(loadedList[i]));
  //     loadedCartProducts.add(prod);
  //   }
  //   sendLoadedToBloc();
  //   print(loadedCartProducts[0].title);
  //   }
  // }

  // void sendLoadedToBloc(){
  //   BlocProvider.of<ProductsBloc>(context).add(LoadCartItems(cart: loadedCartProducts));
  // }

  @override
  Widget build(BuildContext context) {
    ProductModel().toJson();

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: (state as GetProductsState).products.length,
            itemBuilder: (context, index) => Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: kCardPadding,
                height: MediaQuery.of(context).size.height / 5.2,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Image(
                      image: NetworkImage(state.products[index].imageUrl!),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(state.products[index].title!,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: kTitleTextStyle),
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite_outline),
                                color: kGreenAccent,
                                onPressed: () {},
                              )
                            ],
                          ),
                          Text(
                            state.products[index].description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          Text(
                            '\$ ${state.products[index].price!.toString()}',
                            style: kPriceTextStyle,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProductsBloc>(context)
                                      .add(AddToCartEvent(index: index));
                                  // storeData(state.products[index]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kGreenAccent,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: const Text('Add'),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: kGreenAccent,
                                        child: IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            BlocProvider.of<ProductsBloc>(
                                                    context)
                                                .add(DecreaseQuantityEvent(
                                                    index: index));
                                          },
                                        ),
                                      ),
                                      Text((state.products[index].quantity ?? 0)
                                          .toString()),
                                      CircleAvatar(
                                        backgroundColor: kGreenAccent,
                                        child: IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            BlocProvider.of<ProductsBloc>(
                                                    context)
                                                .add(IncreaseQuantityEvent(
                                                    index: index));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
