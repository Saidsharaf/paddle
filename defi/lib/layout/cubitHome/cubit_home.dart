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
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
        print(profileImage!.path);
        emit(paddleProfilePickerSuccessState());
      }
    } catch (e) {}
  }

  ///data/user/0/com.example.defi/cache/999b3a3b-1993-45c2-bd2c-aa3751be4199/images.jpg
  // void uploadProfileImage() {
  //   firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child("users/${Uri.file(profileImage!.path).pathSegments.last}")
  //       .putFile(File(profileImage!.path))
  //       .then((value) {
  //     value.ref.getDownloadURL().then((value) {
  //       print("--------");
  //       print(value);
  //     }).catchError((err) {});
  //   }).catchError((err) {});
  // }

  String profileImageUrl = "";
  void uploadProfileImage() async {
    if (profileImage == null) return;

    emit(paddleProfileUploadLoadingState());
    try {
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("users/${Uri.file(profileImage!.path).pathSegments.last}");
      final uploadTask = storageRef.putFile(File(profileImage!.path));
      final taskSnapshot = await uploadTask;
      final downloadURL = await taskSnapshot.ref.getDownloadURL();
      profileImageUrl = downloadURL;
      print("Profile image uploaded successfully: $downloadURL");
      emit(paddleProfileUploadSuccessState(downloadURL));
    } catch (e) {
      print("Error uploading profile image: $e");
      emit(paddleProfileUploadErrorState(e.toString()));
    }
  }

  String coverImageUrl = "";
  void uploadCoverImage() async {
    if (coverImage == null) return;

    emit(paddleCoverUploadLoadingState());
    try {
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("users/${Uri.file(coverImage!.path).pathSegments.last}");
      final uploadTask = storageRef.putFile(File(coverImage!.path));
      final taskSnapshot = await uploadTask;
      final downloadURL = await taskSnapshot.ref.getDownloadURL();
      coverImageUrl = downloadURL;
      print("Profile image uploaded successfully: $downloadURL");
      emit(paddleCoverUploadSuccessState(downloadURL));
    } catch (e) {
      print("Error uploading profile image: $e");
      emit(paddleCoverUploadErrorState(e.toString()));
    }
  }

  void updateInfoUser({
    @required String? name,
    @required String? bio,
  }) {
    emit(paddleUpdateUserLoadingState());
    if (coverImage != null) {
      uploadCoverImage();
    } else if (profileImage != null) {
      uploadProfileImage();
    } else {
      UsersModel model = UsersModel(
        name: name,
        bio: bio,
        cover: usersModel!.cover,
        profileImage: usersModel!.profileImage,
        uId: uId,
        email: usersModel!.email,
        isEmailVerified: false,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(usersModel!.uId)
          .update(model.toMap())
          .then((value) {
        getUser();
      }).catchError((onError) {
        emit(paddleUpdateUserErrorState());
      });
    }
  }
}
