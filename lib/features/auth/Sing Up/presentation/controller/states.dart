abstract class SingUpStates{}

class InitialSingUpState extends SingUpStates{}

class LoadingSingUp extends SingUpStates{}

class SingUpSuccess extends SingUpStates{}

class SingUpFail extends SingUpStates{
  final String message;
  SingUpFail({required this.message});
}

class ChangePassword extends SingUpStates{}