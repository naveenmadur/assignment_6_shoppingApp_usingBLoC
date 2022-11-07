import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_using_bloc/core/text_styles.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/password_widget.dart';
import 'package:shopping_app_using_bloc/features/shopping_app/presentation/widgets/username_widget.dart';
import 'package:shopping_app_using_bloc/router/app_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? get _userNameErrorText {
    final text = _userNameController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length <= 5) {
      return 'Should have more than 5 characters';
    }
    setState(() {});
    return null;
  }

  String? get _passwordErrorText {
    final text = _passwordController.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 6) {
      return 'Should have more than 6 characters';
    }
    setState(() {});
    return null;
  }

  void _submit(StackRouter router) async {
    if (_userNameErrorText == null) {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth.signInWithEmailAndPassword(
          email: _userNameController.text,
          password: _passwordController.text,
        );
        router.push(const HomeScreenRoute());
      } on FirebaseAuthException catch (error) {
        _userNameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'User not found',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UsernameWidget(userNameController: _userNameController, userNameErrorText: _userNameErrorText),
            PasswordWidget(passwordController: _passwordController, passwordErrorText: _passwordErrorText),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  _userNameController.value.text.isNotEmpty
                      ? _submit(router)
                      : null;
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.teal),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    router.push(const CreateNewAccountScreenRoute());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Creater new Account',
                      style: TextStyles.newAccountTextStyle,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.newAccountTextStyle,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
