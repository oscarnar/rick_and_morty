part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({required String email, required String password})
      : super(email, password);
}

class LoginSuccess extends LoginEvent {
  LoginSuccess()
      : super('', '');
}
