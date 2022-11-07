// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../features/shopping_app/presentation/screens/cart/cart_screen.dart'
    as _i5;
import '../features/shopping_app/presentation/screens/create_new_account_screen/create_new_account_page.dart'
    as _i2;
import '../features/shopping_app/presentation/screens/forgot_password_screen/forgot_password_screen.dart'
    as _i3;
import '../features/shopping_app/presentation/screens/home/home_screen.dart'
    as _i4;
import '../features/shopping_app/presentation/screens/login/login_page.dart'
    as _i1;
import '../features/shopping_app/presentation/screens/orders/orders_screen.dart'
    as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    CreateNewAccountScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CreateNewAccountScreen(),
      );
    },
    ForgotPasswordScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    CartScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CartScreen(),
      );
    },
    OrdersScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.OrdersScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LoginPageRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          CreateNewAccountScreenRoute.name,
          path: '/create-new-account-screen',
        ),
        _i7.RouteConfig(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        ),
        _i7.RouteConfig(
          HomeScreenRoute.name,
          path: '/home-screen',
        ),
        _i7.RouteConfig(
          CartScreenRoute.name,
          path: '/cart-screen',
        ),
        _i7.RouteConfig(
          OrdersScreenRoute.name,
          path: '/orders-screen',
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i7.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i2.CreateNewAccountScreen]
class CreateNewAccountScreenRoute extends _i7.PageRouteInfo<void> {
  const CreateNewAccountScreenRoute()
      : super(
          CreateNewAccountScreenRoute.name,
          path: '/create-new-account-screen',
        );

  static const String name = 'CreateNewAccountScreenRoute';
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordScreenRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordScreenRoute()
      : super(
          ForgotPasswordScreenRoute.name,
          path: '/forgot-password-screen',
        );

  static const String name = 'ForgotPasswordScreenRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home-screen',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i5.CartScreen]
class CartScreenRoute extends _i7.PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: '/cart-screen',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [_i6.OrdersScreen]
class OrdersScreenRoute extends _i7.PageRouteInfo<void> {
  const OrdersScreenRoute()
      : super(
          OrdersScreenRoute.name,
          path: '/orders-screen',
        );

  static const String name = 'OrdersScreenRoute';
}
