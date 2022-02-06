import 'package:auth_page/expanded_demo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  //runApp(const ExpandedDemoScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-- вводим неизменяемую переменную, в которой храним настройки для рамки
    const borderStyle = OutlineInputBorder( //--переменной присваиваем ф-ю настроек рамки
      borderRadius: BorderRadius.all( //--радиус сглаживания рамки. All - все углы
          Radius.circular(36) //--ф-я высчитывания угла 36 градусов
      ),
      borderSide: BorderSide( //--сторона рамки
        color: Color(0xFFc96630), width: 2  //--цвет рамки и ее толщина
      )
    );

    const linkTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color.fromRGBO(92, 37, 7, 0.7)
    );

    return MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(  //--декор всего контейнера
              image: DecorationImage( //--картинка
                image: AssetImage('assets/bg1.jpg'),  //--ассет картинки
                fit: BoxFit.cover,  //--заполнение вида постер
              )
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children:  [
                const SizedBox(height: 60,),
                const SizedBox(
                  width: 110,
                  height: 83,
                  child: Image( //--картинка лого пиццы
                    image: AssetImage('assets/pizza_logo.png'), //--ассет картинки
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Введите логин в виде 10 цифр номера телефона',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(92, 37, 7, 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFe3c7b8),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Телефон',
                  ),
                ),
                const SizedBox(height: 20,),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFe3c7b8),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Пароль',
                  ),
                ),
                const SizedBox(height: 28,),
                SizedBox(
                    width: 154,
                    height: 42,
                    child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Войти'),
                        style: ElevatedButton.styleFrom(  //--стиль кнопки
                          primary: const Color(0xFFc96630), //--цвет кнопки
                          shape: RoundedRectangleBorder(  //--изменение формы кнопки (скругленный прямоугольник)
                            borderRadius: BorderRadius.circular(36),//--скругление границы
                          ),
                        ),
                    )
                ),
                const SizedBox(height: 62,),
                InkWell(child: const Text('Регистрация',
                    style: linkTextStyle,
                ), onTap: (){},),
                const SizedBox(height: 20,),
                InkWell(child: const Text('Забыли пароль?',
                    style: linkTextStyle,
                ), onTap: (){},),
              ],),
            ),
          )
      ),
    );
  }
}

