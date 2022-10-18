import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';
import 'package:shopping_app_using_bloc/core/use_case/use_case.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/domain/repositories/product_repository.dart';
import '../../entities/product_entity.dart';

class AddOrdersToPrefs implements UseCase<void, OrdersParams> {
  AddOrdersToPrefs({
    required this.repo,
  });
  final ProductsRepository repo;

  @override
  Future<Either<Failure, void>> call(OrdersParams params) async {
    return await repo.addOrdersToPrefs(params.prods);
  }
}

class OrdersParams extends Equatable {
  const OrdersParams({
    required this.prods,
  });
  final List<ProductEntity> prods;

  @override
  List<Object?> get props => [prods];
}
