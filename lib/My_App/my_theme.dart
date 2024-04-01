import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: Colors.blue.shade700,
      scaffoldBackgroundColor: const Color(0xffDFECDB),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.5)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey),
      bottomAppBarTheme: const BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        padding: EdgeInsets.all(0),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue.shade700,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 2))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))));
  static ThemeData darkTheme = ThemeData(
      primaryColor: Colors.blue.shade700,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17.5)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey),
      bottomAppBarTheme: const BottomAppBarTheme(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        padding: EdgeInsets.all(0),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue.shade700,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.black, width: 2))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))));
}
