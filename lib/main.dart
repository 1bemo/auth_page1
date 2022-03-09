import 'package:auth_page/test/networking_screen.dart';
import 'package:flutter/material.dart';
import 'screens/auth_page.dart';  //страница авторизации

import 'package:auth_page/test/shared_preferences.dart';  //для кейса 3.1 (основное 1)
import 'package:auth_page/test/files_demo_screen.dart';   //для кейса 3.1 (основное 2)
import 'package:auth_page/test/test_authorization.dart';  //для кейса 3.1 (Дополнительное)

import 'package:auth_page/test/network_post_keys_3.2.dart';  //дял кейса 3.2

void main() {
        //___________________________РАСКОММЕНТИРОВАТЬ НУЖНЫЙ runApp___________________________//

  //---------------------------ДЛЯ КЕЙСА 3.1 (Основное 1)---------------------------//
  //..Использование Shared Preferences (ключ-значение)..//
        //runApp(const SharedPrefScreen());

  //---------------------------ДЛЯ КЕЙСА 3.1 (Основное 2)---------------------------//
  //..Использование системы файлов..//
        //runApp(const FilesDemoScreen());

  //---------------------------ДЛЯ КЕЙСА 3.1 (Дополнительное задание)---------------------------//
  //..Вход с помощью логина, с последующим запоминанием вошедшего (есть возможность разлогиниться)..//
        //runApp(const AuthorizationTest());



  //---------------------------ДЛЯ КЕЙСА 3.2 ---------------------------//
  //..Загрузка json по ссылке post/1..//
        //runApp(const NetworkPostForKeys32());




  //---------------------------БАЗОВЫЙ (для предыдущих кейсов)---------------------------//
    //runApp(const AuthPage());
}