import 'package:auto_route/auto_route.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/cart/cart_screen.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/create_new_account_screen/create_new_account_page.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/home/home_screen.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/login/login_page.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/screens/orders/orders_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage, initial: true),
    AutoRoute(page: CreateNewAccountScreen),
    AutoRoute(page: ForgotPasswordScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: CartScreen),
    AutoRoute(page: OrdersScreen),
  ],
)
class $AppRouter {}
