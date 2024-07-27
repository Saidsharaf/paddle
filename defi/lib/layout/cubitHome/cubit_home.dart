import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/models/usersModel/UsersModel.dart';
import 'package:defi/modules/calls/calls.dart';
import 'package:defi/modules/chat/chat.dart';
import 'package:defi/modules/home/home.dart';
import 'package:defi/modules/challenges/challenges.dart';
import 'package:defi/modules/profile/profile.dart';
import 'package:defi/shared/component/constants.dart';
import 'package:defi/shared/network/local/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PaddleCubit extends Cubit<PaddleStates> {
  PaddleCubit() : super(paddleInitialState());
  static PaddleCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [Home(), Challange(), Calls(), Chat(), Profile()];
  void changeNav(int value) {
    currentIndex = value;
    emit(paddleChangeBottomNavState());
  }

  List<String> title = [
    "Paddle Reservation",
    "challange",
    "Calls",
    "Chat",
    "Profile",
  ];

  List<Icon> itemIcons = [
    Icon(
      Icons.app_registration,
      color: Colors.white,
    ),
    Icon(
      Icons.price_check,
      color: Colors.white,
    ),
    Icon(
      Icons.perm_phone_msg_outlined,
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
  ];

  UsersModel? usersModel;

  void getUser() {
    emit(paddleLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print("***************");
      usersModel = UsersModel.fromJson(value.data()!);
      print("******");
      emit(paddleSuccessState());
    }).catchError((err) {
      emit(paddleErrorState(err));
    });
  }

  bool isDark = false;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(paddleChangeModeState());
    } else {
      isDark = !isDark;
      sharedPref.saveData(key: "isDark", value: isDark).then((value) {
        emit(paddleChangeModeState());
      });
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  XFile? coverImage;

  void getCoverPicker() async {
    try {
      coverImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (coverImage!.path.toString().isNotEmpty) {
        emit(paddlecoverPickerSuccessState());
      }
    } catch (e) {}
  }

  XFile? profileImage;

  void getProfilePicker() async {
    try {
      profileImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (profileImage!.path.toString().isNotEmpty) {
        emit(paddleProfilePickerSuccessState());
      }
    } catch (e) {}
  }

  File? pd;
  final ImagePicker imagedPicker = ImagePicker();

  void getPdPicker() async {
    try {
      final XFile? pickedImage =
          await imagedPicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null && pickedImage.path.isNotEmpty) {
        pd = File(pickedImage.path);
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error picking image: $e');
    }
  }
}
