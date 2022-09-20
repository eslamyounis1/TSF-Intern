abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LogoutSuccessState extends LoginStates {}

class LogoutErrorState extends LoginStates {
  final String error;

  LogoutErrorState(this.error);
}
