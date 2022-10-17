import 'package:dartz/dartz.dart';
import 'package:shopping_app_using_bloc/core/errors/failure.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call();
}