import 'package:defi/modules/loginAndRegister/cubitLogin/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(loginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String? email,
    @required String? password,
  }) {
    emit(loginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      print(value.user!.email);
      emit(loginSuccessState());
    }).catchError((err) {
      emit(loginErrorState(err.toString()));
    });
  }

  bool ispassword = true;
  void changeShowPass() {
    ispassword = !ispassword;
    emit(loginChangeShowPassState());
  }
}
