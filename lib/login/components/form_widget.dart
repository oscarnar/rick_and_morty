import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/login/bloc/login_bloc.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter username";
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: decorationField(
                hintText: 'Username',
                icon: const Icon(Icons.account_circle),
              ),
              onSaved: (value) {
                // Provider.of<UserProvider>(context,listen: false).userLogin.username = value;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter password";
                }
              },
              obscureText: true,
              decoration: decorationField(
                icon: const Icon(Icons.https),
                hintText: 'Password',
              ),
              onSaved: (value) {
                // Provider.of<UserProvider>(context,listen: false).userLogin.password = value;
              },
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red[400]!, width: 2.5),
    borderRadius: BorderRadius.circular(25),
  );
  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue[400]!, width: 2.5),
    borderRadius: BorderRadius.circular(25),
  );
  final OutlineInputBorder enableBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(25),
  );
  InputDecoration decorationField({
    required String hintText,
    required Icon icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      enabledBorder: enableBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedBorder,
      disabledBorder: enableBorder,
      fillColor: Colors.white54,
      filled: true,
      prefixIcon: icon,
    );
  }
}
