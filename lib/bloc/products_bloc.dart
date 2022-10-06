import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';
import 'package:shopping_app_using_bloc/preferences/cart_shared_preference.dart';
import 'package:shopping_app_using_bloc/preferences/orders_shared_preference.dart';
import 'package:shopping_app_using_bloc/repository/products_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  List<ProductModel> products = [];
  List<ProductModel> cart = [];
  List<ProductModel> orders = [];
  List<String>? cartIds = [];

  ProductsBloc() : super(InitialState()) {
    //Fetching Products from http
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

    //Increasing quantity
    on<IncreaseQuantityEvent>((event, emit) {
      if (products[event.index].quantity == null) {
        products[event.index].quantity = 0;
      }
      products[event.index].quantity = products[event.index].quantity! + 1;
      emit(GetProductsState()
          .copyWith(products: products, status: Status.success));
    });

    //Decreasing quantity
    on<DecreaseQuantityEvent>((event, emit) {
      if (products[event.index].quantity! > 0) {
        products[event.index].quantity = products[event.index].quantity! - 1;
      }
      emit(GetProductsState()
          .copyWith(products: products, status: Status.success));
    });

    //Adding to cart
    on<AddToCartEvent>((event, emit) {
      final item = products[event.index];
      if (!(item.isAddedToCart) && item.quantity! > 0) {
        item.isAddedToCart = true;
        cart.add(item);
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));

        //Calling event to save cart items to Shared preferences
        add(AddCartToSharedPreferenceEvent(prods: cart));
      }
    });

    //Adding cart items to Orders
    on<AddToOrdersEvent>((event, emit) {
      orders.addAll(event.orders);
      add(AddOrdersToSharedPreferenceEvent(orders: orders));
      for (int i = 0; i < event.orders.length; i++) {
        event.orders[i].quantity = 0;
        event.orders[i].isAddedToCart = false;
      }
      cart.clear();

      emit(GetProductsState().copyWith(
          products: products,
          cart: cart,
          orders: orders,
          status: Status.success));
      add(NavigateToOrdersScreenEvent());
      add(BuyEvent());
    });


    //----------------------------Navigation's BLoC----------------------------
    //Navigating to cart screen
    on<NavigateToCartScreenEvent>((event, emit) => emit(GetProductsState()
        .copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success)));

    //Navigating to home screen
    on<NavigateToHomeEvent>((event, emit) => emit(GetProductsState().copyWith(
        products: products,
        cart: cart,
        orders: orders,
        status: Status.success)));

    //Navigating to orders screen
    on<NavigateToOrdersScreenEvent>((event, emit) {
      emit(GetProductsState().copyWith(
          products: products,
          cart: cart,
          orders: orders,
          status: Status.success));
    });

    //----------------------------Cart Shared Preferences----------------------------
    //Adding cart items to shared preferences
    on<AddCartToSharedPreferenceEvent>((event, emit) {
      CartSharedPreference.saveProds(event.prods);
      emit(GetProductsState()
          .copyWith(products: products, cart: cart, orders: orders));
    });

    //Loading cart items from shared preferences
    on<LoadCartFromSharedPreferenceEvent>((event, emit) async {
      List<ProductModel>? loadedCart = await CartSharedPreference.loadData();
      if (loadedCart == null) {
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      } else {
        cart.addAll(loadedCart);
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      }
    });

    //----------------------------Orders shared preferences----------------------------
    //Adding orders to shared preferences
    on<AddOrdersToSharedPreferenceEvent>((event, emit) {
      OrdersSharedPreference.saveProds(event.orders);
      emit(GetProductsState()
          .copyWith(products: products, cart: cart, orders: orders));
    });

    //Loading orders from shared preferences
    on<LoadOrdersFromSharedPreferenceEvent>((event, emit) async {
      List<ProductModel>? loadedOrders = await OrdersSharedPreference.loadData();
      if (loadedOrders == null) {
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      } else {
        orders.addAll(loadedOrders);
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      }
    });

    //Clearing shared preferences of Cart on Ordering
    on<BuyEvent>((event, emit) {
      CartSharedPreference.clearData();
      emit(GetProductsState().copyWith(
          products: products,
          cart: cart,
          orders: orders,
          status: Status.success));
    });
  }
}
