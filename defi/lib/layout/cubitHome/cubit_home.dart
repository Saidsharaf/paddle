import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/modules/chat/chat.dart';
import 'package:defi/modules/home/home.dart';
import 'package:defi/modules/profile/profile.dart';
import 'package:defi/modules/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(homeLayoutInitialState());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    Home(),
    Chat(),
    Profile(),
    Settings()
  ];
  void changeNav(int value) {
    currentIndex = value;
    emit(homeLayoutChangeBottomNavState());
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
}
