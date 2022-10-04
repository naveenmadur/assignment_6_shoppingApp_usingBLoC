import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';
import 'package:shopping_app_using_bloc/constants/color_constants.dart';
import 'package:shopping_app_using_bloc/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                padding: kcardPadding,
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
                                    style: ktitleTextStyle),
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite_outline),
                                color: kgreenAccent,
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
                            style: kpriceTextStyle,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  BlocProvider.of<ProductsBloc>(context).add(AddToCartEvent(index: index));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kgreenAccent,
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
                                        backgroundColor: kgreenAccent,
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
                                      Text(state.products[index].quantity
                                          .toString()),
                                      CircleAvatar(
                                        backgroundColor: kgreenAccent,
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
