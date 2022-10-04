part of 'products_bloc.dart';

enum Status { success, failure }

abstract class ProductsState {
  get products => null;
}

//Initial State
class InitialState extends ProductsState {}

//Fetching Products
class GetProductsState extends ProductsState {
  GetProductsState(
      {this.products = const [],
      this.cart = const [],
      this.orders = const [],
      this.status = Status.failure});
  @override
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final List<ProductModel> orders;
  final Status status;

  GetProductsState copyWith(
      {List<ProductModel>? products,
      List<ProductModel>? cart,
      List<ProductModel>? orders,
      Status? status}) {

    return GetProductsState(
        status: status ?? this.status,
        products: products ?? this.products,
        cart: cart ?? this.cart,
        orders: orders ?? this.orders);
  }

  @override
  String toString() {
    return 'Status: $status, products: ${products.length}';
  }
}


