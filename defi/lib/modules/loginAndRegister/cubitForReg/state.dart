
abstract class RegisterStates {}

class registerInitialState extends RegisterStates {}

class registerChangeShowPassState extends RegisterStates {}

class registerChangeRadioState extends RegisterStates {}

class registerLoadingState extends RegisterStates {}

class registerSuccessState extends RegisterStates {
}

class registerErrorState extends RegisterStates {
  final String error;
  registerErrorState(this.error);
}
