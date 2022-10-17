import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/shopping_app/data/model/product_model.dart';
import '../features/shopping_app/domain/entities/product_entity.dart';

class CartSharedPreference {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future saveProds(List<ProductEntity> prodList) async {
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
