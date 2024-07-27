abstract class PaddleStates {}

class paddleInitialState extends PaddleStates {}
class paddleLoadingState extends PaddleStates {}
class paddleSuccessState extends PaddleStates {}
class paddleErrorState extends PaddleStates {
  final String error;
  paddleErrorState(this.error);
}
class paddleChangeBottomNavState extends PaddleStates {}


class paddleChangeModeState extends PaddleStates {}



class paddleProfilePickerSuccessState extends PaddleStates {}
class paddleProfilePickerErrorState extends PaddleStates {}

class paddlecoverPickerSuccessState extends PaddleStates {}
class paddlecoverPickerErrorState extends PaddleStates {}
