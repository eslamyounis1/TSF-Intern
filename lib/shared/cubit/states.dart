abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginGoogleLoadingState extends LoginStates {}

class LoginGoogleSuccessState extends LoginStates {}

class LoginGoogleErrorState extends LoginStates {
  final String error;

  LoginGoogleErrorState(this.error);
}

class LoginFacebookLoadingState extends LoginStates {}

class LoginFacebookSuccessState extends LoginStates {}

class LoginFacebookErrorState extends LoginStates {
  final String error;

  LoginFacebookErrorState(this.error);
}

class LoginCreateEmailAndPasswordLoadingState extends LoginStates{}


class LoginCreateEmailAndPasswordSuccessState extends LoginStates{}


class LoginCreateEmailAndPasswordErrorState extends LoginStates{
  final String error;
  LoginCreateEmailAndPasswordErrorState(this.error);
}

class LoginWithEmailAndPasswordLoadingState extends LoginStates{}

class LoginWithEmailAndPasswordSuccessState extends LoginStates{}


class LoginWithEmailAndPasswordErrorState extends LoginStates{
  final String error;
  LoginWithEmailAndPasswordErrorState(this.error);
}

class LoginGetFacebookUserInfoState extends LoginStates{}


class LogoutLoadingState extends LoginStates{}


class LogoutSuccessState extends LoginStates {}


class LogoutErrorState extends LoginStates {
  final String error;

  LogoutErrorState(this.error);
}
