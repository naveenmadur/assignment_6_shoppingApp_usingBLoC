import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';

class OrdersSharedPreference {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future saveProds(List<ProductModel> prodList) async {
    final SharedPreferences prefs = await _prefs;
    String encodedData = jsonEncode(prodList);
    await prefs.setString("orderItems", encodedData);
  }

  static loadData() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString("orderItems") == null) {
    } else {
      String json = prefs.getString("orderItems")!;
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
