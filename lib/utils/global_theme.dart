import 'package:flutter/material.dart';

const colorBrownDark = Color(0xff4e342e); //--color dark brown
const colorBrownLight = Color(0xffe6b1a5);
const iconBrownColor = colorBrownDark;  //--цвет иконок и разделителей
const snackBarColor = Color(0xff4e342e); //--цвет снекБара

ThemeData globalOrangeTheme() => ThemeData(
    fontFamily: 'Georgia',
    splashColor: Colors.yellow,

    colorScheme: ColorScheme.fromSwatch(  //--цветовая тема
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,
    ).copyWith(
        secondary: Colors.white70
    ),

    textTheme: const TextTheme( //--тема текста
      //______Для Светлой Темы______//
      //--большие заголовки
      headline1: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorBrownDark,),
      //--заголовки
      headline2: TextStyle(fontSize: 18, color: colorBrownDark,),
      //--большие заголовки
      headline3: TextStyle(fontSize: 24, color: colorBrownDark,),
      //--стиль основоного текста
      bodyText1: TextStyle(fontSize: 14, color: colorBrownDark, fontWeight: FontWeight.bold),

      //______Для Темной Темы______//
      //--большие заголовки
      headline4: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorBrownLight,),
      //--заголовки
      headline5: TextStyle(fontSize: 18, color: colorBrownLight,),
      //--большие заголовки
      headline6: TextStyle(fontSize: 24, color: colorBrownLight,),
      //--стиль основоного текста
      bodyText2: TextStyle(fontSize: 14, color: colorBrownLight, fontWeight: FontWeight.bold),

    )
);