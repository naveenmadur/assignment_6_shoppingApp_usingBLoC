import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/core/use_case/use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';

import '../repositories/product_repository.dart';

class GetProductListUseCase extends UseCase {
  final ProductsRepository repository;
  GetProductListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getProductList();
  }
}