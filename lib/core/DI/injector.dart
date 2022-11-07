import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_local_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_remote_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/repository/product_repository_impl.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/cart/add_cart_to_prefs_usecase.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/cart/clear_cart_from_prefs.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/add_orders_to_prefs_use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/get_orders_from_prefs.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/bloc/products_bloc.dart';
import 'package:http/http.dart' as http;
import '../../features/shopping_app/domain/use_cases/cart/get_cart_from_prefs_usecase.dart';
import '../../features/shopping_app/domain/use_cases/get_products_use_case.dart';
part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer? container;
  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container!.resolve();

  @Register.factory(ProductsBloc)
  //!
  @Register.factory(GetProductListUseCase)
  @Register.factory(GetCartFromPrefsUseCase)
  @Register.factory(AddCartToPrefsUseCase)
  @Register.factory(ClearCartSharedPrefsUseCase)
  @Register.factory(AddOrdersToPrefsUseCase)
  @Register.factory(GetOrdersFromPrefsUseCase)
  //!
  @Register.factory(ProductsRepository, from: ProductRepoImpl)
  @Register.factory(ProductListRemoteDataSource,
      from: ProductListRemoteDataSourceImpl)
  @Register.factory(ProductListLocalDataSource,
      from: ProductListLocalDataSourceImpl)
  @Register.factory(http.Client)
  void _configure();
}
