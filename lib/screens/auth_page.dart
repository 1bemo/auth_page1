import 'package:auth_page/utils/drawer_settings.dart';
import '../utils/global_theme.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'settings_screen.dart';
import 'package:flutter/material.dart';
import 'pizza_calc.dart';
import 'registration_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}


/////////___________Набор глобальных переменных___________////////

//--переменная месенджера
final _messengerKey = GlobalKey<ScaffoldMessengerState>();


/////////___________Главный класс___________////////
class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: globalOrangeTheme(),
      scaffoldMessengerKey: _messengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthRegScreen(), //привязваем AuthRegScreen к '/'
        '/pizzaCalc': (context) => const PizzaCalc(),
        '/mainScreen': (context) => const MainPageScreen(),
        '/regScreen': (context)=> const RegistrationPage(),
        '/settingsScreen': (context) => const SettingsScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
      },
    );
  }
}

/////////___________1й стартовый экран___________////////
class AuthRegScreen extends StatefulWidget {
  const AuthRegScreen({Key? key}) : super(key: key);

  @override
  _AuthRegScreenState createState() => _AuthRegScreenState();
}


class _AuthRegScreenState extends State<AuthRegScreen> {

  @override
  Widget build(BuildContext context) {

    //--настройки рамок
    final OutlineInputBorder _borderStyle = OutlineInputBorder(
        borderRadius: const BorderRadius.all(
            Radius.circular(36)
        ),
        borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 2
        )
    );

    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
                children: [
                  TextSpan(text: 'PIZZA ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextSpan(text: 'Авторизация')
                ]
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 50,
        ),
        drawer: navDrawer(context), //--отдельно вынесеный дравер
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(  //--декор всего контейнера
              image: DecorationImage( //--картинка
                image: AssetImage('assets/bg1.jpg'),  //--ассет картинки
                fit: BoxFit.cover,  //--заполнение вида постер
              ),
            ),
            //width: double.infinity,
            //height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children:  [
                const SizedBox(height: 20,),
                const SizedBox(
                  width: 110,
                  height: 83,
                  child: Image( //--картинка лого пиццы
                    image: AssetImage('assets/pizza_logo.png'), //--ассет картинки

                  ),
                ),
                const SizedBox(height: 20,),
                Text('Введите логин в виде 10 цифр номера телефона',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: _borderStyle,
                    focusedBorder: _borderStyle,
                    labelText: 'Телефон',
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    enabledBorder: _borderStyle,
                    focusedBorder: _borderStyle,
                    labelText: 'Пароль',
                  ),
                ),
                const SizedBox(height: 28,),
                SizedBox(
                    width: 154,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: (){
                        _messengerKey.currentState!.showSnackBar(
                          const SnackBar(
                              duration: Duration(
                                  milliseconds: 500
                              ),
                              backgroundColor: snackBarColor,
                              content: Text('Проверка данных и вход')
                          ),
                        );
                      },
                      child: const Text('Войти'),
                      style: ElevatedButton.styleFrom(  //--стиль кнопки
                        primary: Theme.of(context).colorScheme.primary, //--цвет кнопки
                        shape: RoundedRectangleBorder(  //--изменение формы кнопки (скругленный прямоугольник)
                          borderRadius: BorderRadius.circular(36),//--скругление границы
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 62,),
                InkWell(child: Text('Регистрация',
                  style: Theme.of(context).textTheme.headline1,
                ), onTap: (){
                  Navigator.pushNamed(context, '/regScreen');
                },
                ),
                const SizedBox(height: 20,),
                InkWell(child: Text('Забыли пароль?',
                  style: Theme.of(context).textTheme.headline1,
                ), onTap: (){  //ф-я при нажатии (тапе)
                  _messengerKey.currentState!.showSnackBar( //показать снекбар при нажатии
                    const SnackBar(
                        duration: Duration(
                            milliseconds: 500
                        ),
                        backgroundColor: Color(0xff4e342e), //цвет снекбара
                        content: Text('Процедура восстановления пароля')  //текст снекбара
                    ),
                  );
                },
                ),
              ],),
            ),
          ),
        )
    );
  }
}