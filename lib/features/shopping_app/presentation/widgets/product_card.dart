import 'package:flutter/material.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/text_constants.dart';
import '../bloc/products_bloc.dart';
import '../../data/model/product_model.dart';


class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

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
                      margin: kProductCardContainerPadding,
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
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: kGreenAccent,
                                  ),
                                  padding: kProductCardAddButtonPadding,
                                  child: kAddText,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: kProductCardAddIconPadding,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: kGreenAccent,
                                        child: IconButton(
                                          icon: kRemoveIcon,
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
                                          icon: kAddIcon,
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
