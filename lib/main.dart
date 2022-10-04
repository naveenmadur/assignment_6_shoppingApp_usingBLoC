import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_using_bloc/bloc/products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
