import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    Key? key,
    required TextEditingController passwordController,
    required String? passwordErrorText,
  }) : _passwordController = passwordController, _passwordErrorText = passwordErrorText, super(key: key);

  final TextEditingController _passwordController;
  final String? _passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          errorText: _passwordErrorText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}