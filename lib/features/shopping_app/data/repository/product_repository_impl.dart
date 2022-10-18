// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/exception.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_local_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_remote_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';

class ProductRepoImpl implements ProductsRepository {
  final ProductListRemoteDataSource remoteDataSource;
  final ProductListLocalDataSource localDataSource;
  ProductRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() async {
    try {
      final result = await remoteDataSource.getProductList();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Unable to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> addProductsToPrefs(
      List<ProductEntity> prods) async {
    try {
      return Right(localDataSource.cacheCartItem(prods));
    } on CacheException {
      return const Left(DatabaseFailure('Unable to cache'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFromSharedPrefs() async {
    try {
      return Right(await localDataSource.getCartItems());
    } on CacheException {
      return const Left(DatabaseFailure('No Cached Items found'));
    } on Exception {
      return const Left(DatabaseFailure('No Cached Items found'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCartSharedPrefs() async {
    try {
      return Right(await localDataSource.clearCartItem());
    } on Exception {
      return const Left(DatabaseFailure('No Cached Items found'));
    }
  }

  @override
  Future<Either<Failure, void>> addOrdersToPrefs(
      List<ProductEntity> prodList) async {
    try {
      return Right(localDataSource.cacheOrderItem(prodList));
    } on Exception {
      return const Left(DatabaseFailure('Unable to add orders to SF'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getOrdersFromPrefs() async {
    try {
      return Right(await localDataSource.getOrders());
    } on CacheException {
      return const Left(DatabaseFailure('No Cached Items found'));
    } on Exception {
      return const Left(DatabaseFailure('No Cached Items found'));
    }
  }
}
