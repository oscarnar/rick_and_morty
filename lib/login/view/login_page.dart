import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/login/bloc/login_bloc.dart';
import 'package:rick_and_morty/login/components/form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LoginBloc loginProvider = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.redAccent],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.12),
                  child: const Text(''),
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                  child: SizedBox(
                    width: size.width * 0.7,
                    child: FormWidget(),
                  ),
                ),
                const Text(
                  "Forgot password?",
                  style: TextStyle(
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 90,
                  height: 30,
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state.isSuccess == true) {
                        // Navigator.of(context).pushReplacementNamed('/home');
                        AutoRouter.of(context).replaceNamed('/home');
                      }
                      return state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              onPressed: () {
                                // AutoRouter.of(context).pushNamed('/home-page');
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginButtonPressed(
                                    email: '',
                                    password: '',
                                  ),
                                );
                              },
                              child: const Text('LOGIN'),
                            );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.1),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "Login with Google",
                      style: TextStyle(
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      // Navigator.pushReplacementNamed(
                      //     context, Routes.MobileRoute);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
