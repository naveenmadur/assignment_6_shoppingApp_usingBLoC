import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/core/use_case/use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/cart/clear_cart_from_prefs.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/add_orders_to_prefs_use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/get_orders_from_prefs.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/cart/add_cart_to_prefs_usecase.dart';
import '../../domain/use_cases/cart/get_cart_from_prefs_usecase.dart';
import '../../domain/use_cases/get_products_use_case.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductListUseCase getProductListUseCase;
  final GetCartFromPrefsUseCase getItemsFromPrefsUseCase;
  final AddCartToPrefsUseCase addToPrefsUseCase;
  final ClearCartSharedPrefsUseCase clearCartSharedPrefs;
  final AddOrdersToPrefsUseCase addOrdersToPrefsUseCase;
  final GetOrdersFromPrefsUseCase getOrdersFromPrefsUseCase;

  List<ProductEntity> products = [];
  List<ProductEntity> cart = [];
  List<ProductEntity> orders = [];
  List<String>? cartIds = [];

  ProductsBloc(
      {required this.getProductListUseCase,
      required this.getItemsFromPrefsUseCase,
      required this.addToPrefsUseCase,
      required this.clearCartSharedPrefs,
      required this.addOrdersToPrefsUseCase,
      required this.getOrdersFromPrefsUseCase})
      : super(InitialState()) {

    void getCartFromPrefs() async {
      final result = await getItemsFromPrefsUseCase.call(NoParams());
      result.fold((l) {}, (r) {
        cart = r;
      });
    }

    void getOrdersFromPrefs() async {
      final result = await getOrdersFromPrefsUseCase.call(NoParams());
      result.fold((l) {
      }, (r) {
        orders = r;
        
      });
    }

    //! Using clean code...

    on<GetProductsEvent>((event, emit) async {
      getCartFromPrefs();
      getOrdersFromPrefs();
      // add(LoadCartFromSharedPreferenceEvent());
      // add(LoadOrdersFromSharedPreferenceEvent());
      final result = await getProductListUseCase.call(NoParams());
      result.fold((l) {
        emit(ErrorState(message: l.message));
      }, (r) {
        products = r;
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      });
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
        addToPrefsUseCase.call(CartParams(prods: cart));
        emit(GetProductsState().copyWith(
            products: products,
            cart: cart,
            orders: orders,
            status: Status.success));
      }
    });

    //Adding cart items to Orders
    on<AddToOrdersEvent>((event, emit) {
      orders.addAll(event.orders);
      addOrdersToPrefsUseCase.call(OrdersParams(prods: orders));
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
      add(BuyEvent());
    });

    //Clearing shared preferences of Cart on Ordering
    on<BuyEvent>((event, emit) async {
      clearCartSharedPrefs.call(NoParams());
      emit(GetProductsState().copyWith(
          products: products,
          cart: cart,
          orders: orders,
          status: Status.success));
    });
  }
}
