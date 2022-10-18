import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

//! Contract
abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();
  //? Cart Shared Preferences
  Future<Either<Failure, void>> addProductsToPrefs(List<ProductEntity> prodList);
  Future<Either<Failure,List<ProductEntity>>> getFromSharedPrefs();
  Future<Either<Failure, void>> clearCartSharedPrefs();
  //? Orders Shared Preferences
  Future<Either<Failure,void>> addOrdersToPrefs(List<ProductEntity> prodList);
  Future<Either<Failure, List<ProductEntity>>> getOrdersFromPrefs();
}