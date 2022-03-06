import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
   final _messengerKey = GlobalKey<ScaffoldMessengerState>(); //переменная (месенджер) для всплывающего снизу снекбара

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,  //вставляем переменную месенджера
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        drawer: Drawer( //выдвигающийся шкаф сбоку
          child: ListView(  //представление в виде списка
            padding: EdgeInsets.zero, //нулевые отступы вида списка
            children: [
               DrawerHeader(  //шапка в выдвигающимся шкафу
                decoration: const BoxDecoration(
                  color: Colors.orange
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
                          const Text(
                            'Каталог',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF3d1d00)
                            ),
                          ),
                        ],
                      ),
                  ),
              ),
              ListTile( //часть списка
                leading: const Icon(Icons.call_to_action_rounded),  //иконка вначале
                title: const Text('Каталог'), //подпись
                onTap: (){  //ф-я при нажатии (тапе)
                  _messengerKey.currentState!.showSnackBar( //показать снекбар при нажатии
                    const SnackBar(
                        backgroundColor: Color(0xff4e342e), //цвет снекбара
                        content: Text('Переход в каталог')  //текст снекбара
                    )
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.restore_from_trash),
                title: const Text('Корзина'),
                onTap: (){
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(
                        backgroundColor: Color(0xff4e342e),
                        content:Text('Переход в корзину')
                    )
                  );
                },
              ),
              const Divider(  //разделитель
                color: Colors.orange,
              ),
              const Padding(  //виджет отступа
                padding: EdgeInsets.only(left: 10),
                  child: Text('Профиль')
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Настройки'),
                onTap: (){
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(
                        backgroundColor: Color(0xff4e342e),
                        content: Text('Переход в настройки')
                    )
                  );
                },
              ),
            ],
          ),
        ),
        body: const Center(child: Text('some text')),
      ),
    );
  }
}
