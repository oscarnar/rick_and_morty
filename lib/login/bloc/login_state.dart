part of 'login_bloc.dart';

@immutable
class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  
  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
      );
}

class LoginInitialState extends LoginState {
  LoginInitialState({
    isLoading = false,
    isSuccess = false,
    isFailure = false,
  }) : super(
          isLoading: isLoading,
          isSuccess: isSuccess,
          isFailure: isFailure,
        );
}
