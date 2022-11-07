import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/cart/clear_cart_from_prefs.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/add_orders_to_prefs_use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/orders/get_orders_from_prefs.dart';
import 'features/shopping_app/data/data_source/product_list_local_data_source.dart';
import 'features/shopping_app/data/data_source/product_list_remote_data_source.dart';
import 'features/shopping_app/data/repository/product_repository_impl.dart';
import 'features/shopping_app/domain/use_cases/cart/add_cart_to_prefs_usecase.dart';
import 'features/shopping_app/domain/use_cases/cart/get_cart_from_prefs_usecase.dart';
import 'features/shopping_app/domain/use_cases/get_products_use_case.dart';
import 'features/shopping_app/presentation/bloc/products_bloc.dart';
import 'features/shopping_app/domain/repositories/product_repository.dart';

final sl = GetIt.instance;

void init() async {
  //! Features
  //* Bloc
  sl.registerFactory(() => ProductsBloc(
        getProductListUseCase: sl(),
        getItemsFromPrefsUseCase: sl(),
        addToPrefsUseCase: sl(),
        clearCartSharedPrefs: sl(),
        addOrdersToPrefsUseCase: sl(),
        getOrdersFromPrefsUseCase: sl(),
      ));

  //* Use Case
  sl.registerLazySingleton(() => GetProductListUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCartFromPrefsUseCase(repo: sl()));
  sl.registerLazySingleton(() => AddCartToPrefsUseCase(repo: sl()));
  sl.registerLazySingleton(() => ClearCartSharedPrefsUseCase(repo: sl()));
  sl.registerLazySingleton(() => AddOrdersToPrefsUseCase(repo: sl()));
  sl.registerLazySingleton(() => GetOrdersFromPrefsUseCase(repo: sl()));

  //* Repository
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductRepoImpl(remoteDataSource: sl(), localDataSource: sl()));

  //*  Data Source
  sl.registerLazySingleton<ProductListRemoteDataSource>(
      () => ProductListRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProductListLocalDataSource>(
      () => ProductListLocalDataSourceImpl());

  //! External
  sl.registerLazySingleton(() => http.Client());
}
