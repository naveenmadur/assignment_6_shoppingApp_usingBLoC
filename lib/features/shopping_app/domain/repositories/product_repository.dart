import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';

import '../entities/product_entity.dart';

//! Contract
abstract class ProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();
}