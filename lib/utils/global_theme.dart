import 'package:flutter/material.dart';

const colorBrownDark = Color(0xff4e342e); //--color dark brown
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
      //--стиль ссылок
      headline1: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorBrownDark,),
      //--заголовки
      headline2: TextStyle(fontSize: 18, color: colorBrownDark,),
      //--большие заголовки
      headline3: TextStyle(fontSize: 24, color: colorBrownDark,),
      //--стиль основоного текста
      bodyText1: TextStyle(fontSize: 14, color: colorBrownDark, fontWeight: FontWeight.bold),
    )
);