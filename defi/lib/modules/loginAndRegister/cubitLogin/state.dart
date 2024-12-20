abstract class LoginStates {}

class loginInitialState extends LoginStates {}

class loginChangeShowPassState extends LoginStates {}

class loginLoadingState extends LoginStates {}

class loginSuccessState extends LoginStates {
  final String uId;

  loginSuccessState({required this.uId});

}

class loginErrorState extends LoginStates {
  final String error;
  loginErrorState(this.error);
}
