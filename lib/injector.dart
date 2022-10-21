import 'package:kiwi/kiwi.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/bloc/products_bloc.dart';
part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();
  @Register.factory(ProductsBloc)
  void configure();
}
