// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/core/use_case/use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';

class GetOrdersFromPrefsUseCase implements UseCase<List<ProductEntity>,NoParams> {
  ProductsRepository repo;
  GetOrdersFromPrefsUseCase({
    required this.repo,
  });
  
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return repo.getOrdersFromPrefs();
  }

}
