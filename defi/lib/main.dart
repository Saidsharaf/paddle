import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:defi/modules/loginAndRegister/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 0, 151, 178),
        ),
        //primarySwatch: Color.fromARGB(255, 0, 151, 178),
        // scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[100],
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 0, 151, 178),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
        primaryColor: Color.fromARGB(255, 0, 151, 178),
        cardColor: Color.fromARGB(255, 0, 151, 178),
      ),
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
        nextScreen: LoginScreen(),
      ),
    );
  }
}
