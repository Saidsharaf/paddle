import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode = ThemeData(
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
);

ThemeData darkMode = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 0, 151, 178),
  ),
  //primarySwatch: Color.fromARGB(255, 0, 151, 178),
  scaffoldBackgroundColor: Color.fromARGB(255, 67, 111, 114),
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 67, 111, 114),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color.fromARGB(255, 67, 111, 114),
    elevation: 0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
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
      color: Colors.white,
    ),
  ),
  primaryColor: Color.fromARGB(255, 0, 151, 178),
  cardColor: Color.fromARGB(255, 0, 151, 178),
);
