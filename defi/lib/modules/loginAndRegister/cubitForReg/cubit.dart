import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/models/usersModel/UsersModel.dart';
import 'package:defi/modules/loginAndRegister/cubitForReg/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String? username,
    @required String? email,
    @required String? password,
  }) {
    emit(registerLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      print(value.user!.email);
      userCreate(username: username, email: email, uId: value.user!.uid);
    }).catchError((err) {
      emit(registerErrorState(err.toString()));
    });
  }

  void userCreate({
    @required String? username,
    @required String? email,
    @required String? uId,
  }) {
    emit(registerLoadingState());
    UsersModel usersModel = UsersModel(
      email: email,
      name: username,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(usersModel.toMap())
        .then((value) {
      emit(registerCreateSuccessState());
    }).catchError((error) {
      emit(registerCreateErrorState(error.toString()));
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
