import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? id;
  String? title, description, imageUrl;
  num? price;
  int? quantity;
  bool isAddedToCart;

   ProductEntity(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.price,
      this.quantity,
      this.isAddedToCart = false});

  @override
  List<Object?> get props =>
      [id, title, description, imageUrl, price, quantity, isAddedToCart];
}
