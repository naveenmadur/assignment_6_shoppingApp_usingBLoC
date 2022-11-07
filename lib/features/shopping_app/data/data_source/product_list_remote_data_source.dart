import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../constants/url.dart';
import '../model/product_model.dart';
import '../../../../core/errors/exception.dart';

abstract class ProductListRemoteDataSource {
  Future<List<ProductModel>> getProductList();
}

class ProductListRemoteDataSourceImpl extends ProductListRemoteDataSource {
  final http.Client client;
  ProductListRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getProductList() async {
    final url = Uri.parse(Url.baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      return body.map((dynamic data) {
        final map = data as Map<String, dynamic>;
        return ProductModel.fromJson(map);
      }).toList();
    } else {
      throw ServerException();
    }
  }
}
