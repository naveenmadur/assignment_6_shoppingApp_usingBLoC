class ProductModel {
  int? id;
  String? title, description, imageUrl;
  num? price;
  int quantity = 0;
  bool isAddedToCart = false;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.price,
      this.quantity = 0,
      this.isAddedToCart = false});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = imageUrl;
    return data;
  }

}
