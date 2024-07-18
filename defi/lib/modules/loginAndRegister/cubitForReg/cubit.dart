import 'package:defi/modules/loginAndRegister/cubitForReg/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String? email,
    @required String? password,
    //  @required String? username,
  }) {
    emit(registerLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      print(value.user!.email);
      emit(registerSuccessState());
    }).catchError((err) {
      emit(registerErrorState(err.toString()));
    });
  }

  bool ispassword = true;
  void changeShowPass() {
    ispassword = !ispassword;
    emit(registerChangeShowPassState());
  }
  bool isConPassword = true;
  void changeConPass() {
    isConPassword = !isConPassword;
    emit(registerChangeShowPassState());
  }

  String? selectedValue;
  void changeRadio(value) {
    selectedValue = value;
    emit(registerChangeShowPassState());
  }
}
