import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/models/usersModel/UsersModel.dart';
import 'package:defi/modules/chat/chat.dart';
import 'package:defi/modules/home/home.dart';
import 'package:defi/modules/profile/profile.dart';
import 'package:defi/modules/setting/setting.dart';
import 'package:defi/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaddleCubit extends Cubit<PaddleStates> {
  PaddleCubit() : super(paddleInitialState());
  static PaddleCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [Home(), Chat(), Profile(), Setting()];
  void changeNav(int value) {
    currentIndex = value;
    emit(paddleChangeBottomNavState());
  }

  List<String> title = [
    "Home",
    "Chat",
    "Profile",
    "Setting",
  ];

  List<Icon> itemIcons = [
    Icon(
      Icons.home,
      color: Colors.white,
    ),
    Icon(
      Icons.chat,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
    ),
    Icon(
      Icons.settings,
      color: Colors.white,
    ),
  ];

  UsersModel? usersModel;

  void getUser() {
    emit(paddleLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      usersModel = UsersModel.fromJson(value.data()!);
      emit(paddleSuccessState());
    }).catchError((err) {
      emit(paddleErrorState(err));
    });
  }
}
