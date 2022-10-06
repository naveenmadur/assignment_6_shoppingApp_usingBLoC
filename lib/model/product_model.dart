class ProductModel {
  int? id;
  String? title, description, imageUrl;
  num? price;
  int? quantity;
  bool isAddedToCart = false;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.price,
      this.quantity,
      this.isAddedToCart = false});

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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = imageUrl;
    data['quantity'] = quantity;
    data['isAddedToCart'] = isAddedToCart;
    return data;
  }

}
