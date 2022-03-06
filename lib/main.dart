import 'package:flutter/material.dart';
import 'screens/auth_page.dart';  //страница авторизации

import 'package:auth_page/test/shared_preferences.dart';  //для кейса 3.1 (основное 1)
import 'package:auth_page/test/files_demo_screen.dart';   //для кейса 3.1 (основное 2)
import 'package:auth_page/test/test_authorization.dart';  //для кейса 3.1 (Дополнительное)

void main() {
  //---------------------------ДЛЯ КЕЙСА 3.1 (Основное 1)---------------------------//
  //..Использование Shared Preferences (ключ-значение)..//
        runApp(const SharedPrefScreen());

  //---------------------------ДЛЯ КЕЙСА 3.1 (Основное 2)---------------------------//
  //..Использование системы файлов..//
        //runApp(const FilesDemoScreen());

  //---------------------------ДЛЯ КЕЙСА 3.1 (Дополнительное задание)---------------------------//
  //..Вход с помощью логина, с последующим запоминанием вошедшего (есть возможность разлогиниться)..//
        //runApp(const AuthorizationTest());





  //---------------------------БАЗОВЫЙ (для предыдущих кейсов)---------------------------//
  //runApp(const AuthPage());
}