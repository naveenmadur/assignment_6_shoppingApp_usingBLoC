import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {super.id,
      super.title,
      super.description,
      super.imageUrl,
      super.price,
      super.quantity,
      super.isAddedToCart});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['image'];
    quantity = json['quantity'] ?? 0;
    isAddedToCart = json['isAddedToCart'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = imageUrl;
    data['quantity'] = quantity;
    data['isAddedToCart'] = isAddedToCart;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        imageUrl,
        quantity,
        isAddedToCart,
      ];
}
