import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:defi/layout/cubitHome/cubit_home.dart';
import 'package:defi/layout/cubitHome/state_home.dart';
import 'package:defi/layout/home_layout.dart';
import 'package:defi/modules/loginAndRegister/login.dart';
import 'package:defi/shared/component/constants.dart';
import 'package:defi/shared/component/theme.dart';
import 'package:defi/shared/network/local/sharedPref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sharedPref.init();
  bool? isDark = sharedPref.getData(key: "isDark");
  Widget? widget;
  uId = sharedPref.getData(key: "uId");

  if (uId != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  final bool? isDark;
  const MyApp({
    super.key,
    this.startWidget,
    this.isDark,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaddleCubit()
        ..getUser()
        ..changeMode(fromShared: isDark),
      child: BlocConsumer<PaddleCubit, PaddleStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: PaddleCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: AnimatedSplashScreen(
              backgroundColor: Color.fromARGB(255, 0, 151, 178),
              splash: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/logosplach.png",
                ),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                radius: 70,
              ),
              splashIconSize: 200,
              splashTransition: SplashTransition.scaleTransition,
              duration: 1000,
              nextScreen: startWidget!,
            ),
          );
        },
      ),
    );
  }
}
