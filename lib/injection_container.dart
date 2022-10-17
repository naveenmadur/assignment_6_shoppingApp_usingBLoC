import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_remote_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/repository/product_repository_impl.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/use_cases/get_products_use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/bloc/products_bloc.dart';
import 'features/shopping_app/domain/repositories/product_repository.dart';

final sl = GetIt.instance;

void init() async {
  //! Features
  //* Bloc
  sl.registerFactory(() => ProductsBloc(
        getProductListUseCase: sl(),
      ));

  //* Use Case
  sl.registerLazySingleton(() => GetProductListUseCase(repository: sl()));

  //* Repository
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductRepoImpl(remoteDataSource: sl()));

  //*  Data Source
  sl.registerLazySingleton<ProductListRemoteDataSource>(
      () => ProductListRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<>(() => );

  //! External
  sl.registerLazySingleton(() => http.Client());
}
