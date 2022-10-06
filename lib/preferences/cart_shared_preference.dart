import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app_using_bloc/model/product_model.dart';

class CartSharedPreference {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future saveProds(List<ProductModel> prodList) async {
    final SharedPreferences prefs = await _prefs;
    String encodedData = jsonEncode(prodList);
    await prefs.setString('cartItems', encodedData);
  }

  static loadData() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString("cartItems") == null) {
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

  static clearData() async{
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
