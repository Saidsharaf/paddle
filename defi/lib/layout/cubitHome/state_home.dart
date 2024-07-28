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



class paddleProfileUploadLoadingState extends PaddleStates {}
class paddleProfileUploadSuccessState extends PaddleStates {
  paddleProfileUploadSuccessState(String downloadURL);
}
class paddleProfileUploadErrorState extends PaddleStates {
  paddleProfileUploadErrorState(String string);
}


class paddleCoverUploadLoadingState extends PaddleStates {}
class paddleCoverUploadSuccessState extends PaddleStates {
  paddleCoverUploadSuccessState(String downloadURL);
}
class paddleCoverUploadErrorState extends PaddleStates {
  paddleCoverUploadErrorState(String string);
}


class paddleUpdateUserLoadingState extends PaddleStates {}
class paddleUpdateUserErrorState extends PaddleStates {}
