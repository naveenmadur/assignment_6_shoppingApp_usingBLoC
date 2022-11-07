import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/product_entity.dart';

import '../repositories/product_repository.dart';

class GetProductListUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductsRepository repository;
  GetProductListUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.getProductList();
  }
}
