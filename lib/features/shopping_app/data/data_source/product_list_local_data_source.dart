import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exception.dart';
import '../model/product_model.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductListLocalDataSource {
  Future<List<ProductModel>> getCartItems();
  Future<void> cacheCartItem(List<ProductEntity> prodList);
  Future<void> clearCartItem();
  Future<void> cacheOrderItem(List<ProductEntity> prodList);
  Future<List<ProductModel>> getOrders();
}

class ProductListLocalDataSourceImpl implements ProductListLocalDataSource {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static final Future<SharedPreferences> _prefsOrders =
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
  Future<void> clearCartItem() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  @override
  Future<void> cacheOrderItem(List<ProductEntity> prodList) async {
    final SharedPreferences prefs = await _prefsOrders;
    String encodedData = jsonEncode(prodList);
    await prefs.setString("orders", encodedData);
  }

  @override
  Future<List<ProductModel>> getOrders() async {
    final SharedPreferences prefs = await _prefsOrders;
    if (prefs.getString("orders") == null) {
      throw CacheException();
    } else {
      String json = prefs.getString("orders")!;
      List<ProductModel> decode(String json) {
        final product = (jsonDecode(json) as List<dynamic>)
            .map<ProductModel>((item) => ProductModel.fromJson(item))
            .toList();
        return product;
      }

      return decode(json);
    }
  }
}
