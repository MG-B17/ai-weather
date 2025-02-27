abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class LoadingLogin extends LoginStates{}

class LoginSuccess extends LoginStates{}

class LoginFail extends LoginStates{
  final String message;

  LoginFail({required this.message});
}

class ChangePasswordIcon extends LoginStates{}
