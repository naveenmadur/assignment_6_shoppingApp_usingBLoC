part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class IncreaseQuantityEvent extends ProductsEvent {
  final int index;
  IncreaseQuantityEvent({required this.index});
}

class DecreaseQuantityEvent extends ProductsEvent {
  DecreaseQuantityEvent({required this.index});
  final int index;
}

class AddToCartEvent extends ProductsEvent {
  final int index;
  AddToCartEvent({required this.index});
}

class AddToOrdersEvent extends ProductsEvent {
  final List<ProductEntity> orders;
  AddToOrdersEvent({required this.orders});
}

class NavigateToCartScreenEvent extends ProductsEvent {}

class NavigateToHomeEvent extends ProductsEvent {}

class NavigateToOrdersScreenEvent extends ProductsEvent {}

class AddCartToSharedPreferenceEvent extends ProductsEvent {
  final List<ProductEntity> prods;
  AddCartToSharedPreferenceEvent({required this.prods});
}

class LoadCartFromSharedPreferenceEvent extends ProductsEvent {}

class AddOrdersToSharedPreferenceEvent extends ProductsEvent{
  final List<ProductEntity> orders;
  AddOrdersToSharedPreferenceEvent({required this.orders});
}

class LoadOrdersFromSharedPreferenceEvent extends ProductsEvent{}

class BuyEvent extends ProductsEvent {}
