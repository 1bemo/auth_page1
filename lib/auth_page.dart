import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();  //переменная месенджера

  @override
  Widget build(BuildContext context) {

    //color[900]
    const _colorOrangeDeep = Color(0xffe65100);
    //color dark brown
    const _colorBrownDark = Color(0xff4e342e);

    //-- вводим неизменяемую переменную, в которой храним настройки для рамки
    const borderStyle = OutlineInputBorder( //--переменной присваиваем ф-ю настроек рамки
        borderRadius: BorderRadius.all( //--радиус сглаживания рамки. All - все углы
            Radius.circular(36) //--ф-я высчитывания угла 36 градусов
        ),
        borderSide: BorderSide( //--сторона рамки
            color: _colorOrangeDeep, width: 2  //--цвет рамки и ее толщина
        )
    );

    //-- стиль текста отдельной переменной
    const linkTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: _colorBrownDark
    );

    //отрисовка
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Авторизация',
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: Colors.orange[900],
            toolbarHeight: 50,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                  DrawerHeader(  //шапка в выдвигающимся шкафу
                   decoration: const BoxDecoration(
                       color: _colorOrangeDeep
                   ),
                   child: Container(
                     alignment: Alignment.centerLeft,
                     height: 200,  //высота контейнера
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,  //выравнивание по главной оси
                       crossAxisAlignment: CrossAxisAlignment.center,  //выравнивание по вспомогательное оси
                       children: [
                         Container(
                           height: 100,
                           decoration: const BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(50)
                             ),
                           ),
                           //картинка из внешнего источника
                           child: Image.network('https://cdn.discordapp.com/attachments/607314199605149717/944134627419901952/logo_pizza.png'),
                         ),
                       ],
                     ),
                   ),
                 ),
                ListTile(
                  leading: const Icon(Icons.accessibility,color: _colorBrownDark,),
                  title: const Text('Авторизация / Регистрация',style: TextStyle(color: _colorBrownDark),),
                  onTap: (){},
                ),
                const Divider(color: _colorBrownDark,indent: 20,endIndent: 20,),
                ListTile(
                  title: const Text('Главная страница',style: TextStyle(color: _colorBrownDark),),
                  onTap: (){},
                  leading: const Icon(Icons.local_pizza,color: _colorBrownDark,),
                )
              ],
            ),
          ),
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
                  const Text('Введите логин в виде 10 цифр номера телефона',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff4e342e),
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
                        onPressed: (){
                          _messengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              duration: Duration(
                                milliseconds: 500
                              ),
                              backgroundColor: Color(0xff4e342e),
                              content: Text('Проверка данных и вход')
                            ),
                          );
                        },
                        child: const Text('Войти'),
                        style: ElevatedButton.styleFrom(  //--стиль кнопки
                          primary: _colorOrangeDeep, //--цвет кнопки
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
      ),
    );
  }
}
