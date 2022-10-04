import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';
import 'package:shopping_app_using_bloc/repository/products_repo.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  List<ProductModel> products = [];
  List<ProductModel> cart = [];
  List<ProductModel> orders = [];

  ProductsBloc() : super(InitialState()) {
    on<GetProductsEvent>((event, emit) async {
      try {
        final posts = await ProductsRepository().fetchProductData();
        products = posts;
        return emit(GetProductsState()
            .copyWith(products: products, status: Status.success));
      } catch (error) {
        return emit(GetProductsState().copyWith(status: Status.failure));
      }
    });

    on<IncreaseQuantityEvent>((event, emit) {
      products[event.index].quantity += 1;
      emit(GetProductsState()
          .copyWith(products: products, status: Status.success));
    });

    on<DecreaseQuantityEvent>((event, emit) {
      if (products[event.index].quantity > 0) {
        products[event.index].quantity -= 1;
      }
      emit(GetProductsState()
          .copyWith(products: products, status: Status.success));
    });

    on<AddToCartEvent>((event, emit) {
      final item = products[event.index];
      if (!(item.isAddedToCart) && item.quantity > 0) {
        cart.add(item);
        print(cart[0].title);
      }
    });

    on<NavigateToCartScreenEvent>((event, emit) => emit(GetProductsState()
        .copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success)));

    on<NavigateToHomeEvent>((event, emit) => emit(GetProductsState().copyWith(
        products: products,
        cart: cart,
        orders: orders,
        status: Status.success)));
  }
}
