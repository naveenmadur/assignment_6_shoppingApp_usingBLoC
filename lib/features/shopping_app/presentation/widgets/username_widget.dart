import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({
    Key? key,
    required TextEditingController userNameController,
    required String? userNameErrorText,
  }) : _userNameController = userNameController, _userNameErrorText = userNameErrorText, super(key: key);

  final TextEditingController _userNameController;
  final String? _userNameErrorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextField(
        controller: _userNameController,
        decoration: InputDecoration(
          labelText: 'Enter User Name',
          errorText: _userNameErrorText,
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