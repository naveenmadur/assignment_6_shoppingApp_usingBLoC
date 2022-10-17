import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_using_bloc/core/errors/exception.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/model/product_model.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';

abstract class ProductListLocalDataSource {
  Future<List<ProductModel>> getCartItems();
  Future<void> cacheCartItem(List<ProductEntity> prodList);
  Future<void> clearCacheItem();
}

class ProductListLocalDataSourceImpl implements ProductListLocalDataSource {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  @override
  Future<void> cacheCartItem(List<ProductEntity> prodList) async {
    final SharedPreferences prefs = await _prefs;
    String encodedData = jsonEncode(prodList);
    await prefs.setString('cartItems', encodedData);
  }

  @override
  Future<List<ProductModel>> getCartItems() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString("cartItems") == null) {
      throw CacheException();
    } else {
      String json = prefs.getString("cartItems")!;
      List<ProductModel> decode(String json) {
        final product = (jsonDecode(json) as List<dynamic>)
            .map<ProductModel>((item) => ProductModel.fromJson(item))
            .toList();
        return product;
      }

      return decode(json);
    }
  }

  @override
  Future<void> clearCacheItem() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
