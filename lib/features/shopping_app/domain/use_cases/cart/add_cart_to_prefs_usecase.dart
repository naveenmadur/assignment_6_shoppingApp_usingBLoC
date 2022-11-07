// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/core/use_case/use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';

class AddCartToPrefsUseCase implements UseCase<void, CartParams> {
  final ProductsRepository repo;
  AddCartToPrefsUseCase({
    required this.repo,
  });

  @override
  Future<Either<Failure, void>> call(CartParams params) async {
    return await repo.addProductsToPrefs(params.prods);
  }
}

class CartParams extends Equatable {
  final List<ProductEntity> prods;
  const CartParams({
    required this.prods,
  });

  @override
  List<Object?> get props => [prods];
}
