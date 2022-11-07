// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => ProductsBloc(
          getProductListUseCase: c<GetProductListUseCase>(),
          getItemsFromPrefsUseCase: c<GetCartFromPrefsUseCase>(),
          addToPrefsUseCase: c<AddCartToPrefsUseCase>(),
          clearCartSharedPrefs: c<ClearCartSharedPrefsUseCase>(),
          addOrdersToPrefsUseCase: c<AddOrdersToPrefsUseCase>(),
          getOrdersFromPrefsUseCase: c<GetOrdersFromPrefsUseCase>()))
      ..registerFactory(
          (c) => GetProductListUseCase(repository: c<ProductsRepository>()))
      ..registerFactory(
          (c) => GetCartFromPrefsUseCase(repo: c<ProductsRepository>()))
      ..registerFactory(
          (c) => AddCartToPrefsUseCase(repo: c<ProductsRepository>()))
      ..registerFactory(
          (c) => ClearCartSharedPrefsUseCase(repo: c<ProductsRepository>()))
      ..registerFactory(
          (c) => AddOrdersToPrefsUseCase(repo: c<ProductsRepository>()))
      ..registerFactory(
          (c) => GetOrdersFromPrefsUseCase(repo: c<ProductsRepository>()))
      ..registerFactory<ProductsRepository>((c) => ProductRepoImpl(
          remoteDataSource: c<ProductListRemoteDataSource>(),
          localDataSource: c<ProductListLocalDataSource>()))
      ..registerFactory<ProductListRemoteDataSource>(
          (c) => ProductListRemoteDataSourceImpl(client: c<Client>()))
      ..registerFactory<ProductListLocalDataSource>(
          (c) => ProductListLocalDataSourceImpl())
      ..registerFactory((c) => Client());
  }
}
