import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
      switch (event.runtimeType) {
        case LoginEvent:
          emit(LoginInitialState());
          break;
        case LoginButtonPressed:
          emit(
            state.copyWith(isLoading: true),
          );
          _login(event.email, event.password);
          break;
        case LoginSuccess:
          emit(state.copyWith(isLoading: false, isSuccess: true));
          break;
        default:
      }
    });
  }

  void _login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    add(LoginSuccess());
  }
}
