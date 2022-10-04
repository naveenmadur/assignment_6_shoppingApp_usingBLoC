import 'package:http/http.dart' as http;
import 'package:shopping_app_using_bloc/model/product_model.dart';
import 'dart:convert';

class ProductsRepository {

  Future<List<ProductModel>> fetchProductData() async {
    final url = Uri.parse('https://fakestoreapi.com/products');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      return body.map((dynamic data) {
        final map = data as Map<String, dynamic>;
        return ProductModel.fromJson(map);
      }).toList();
    }
    throw Exception('error fetching post');
  }
}
