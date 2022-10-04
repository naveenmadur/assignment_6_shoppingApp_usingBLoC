part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class IncreaseQuantityEvent extends ProductsEvent {
  final int index;
  IncreaseQuantityEvent({required this.index});
}

class DecreaseQuantityEvent extends ProductsEvent{
  DecreaseQuantityEvent({required this.index});
  final int index;
}

class AddToCartEvent extends ProductsEvent {
  final int index;
  AddToCartEvent({required this.index});
}


class NavigateToCartScreenEvent extends ProductsEvent{}

class NavigateToHomeEvent extends ProductsEvent{}
