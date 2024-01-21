
class LoginStates {}

class LoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class ErrorState extends LoginStates {
  String message;
  ErrorState(this.message);
}