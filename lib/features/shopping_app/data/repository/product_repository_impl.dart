// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/exception.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/data/data_source/product_list_remote_data_source.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';

class ProductRepoImpl implements ProductsRepository {
  final ProductListRemoteDataSource remoteDataSource;
  ProductRepoImpl({
    required this.remoteDataSource,
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
}
