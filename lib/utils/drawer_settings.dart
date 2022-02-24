import 'package:flutter/material.dart';
import 'global_theme.dart';

String currentScreen = 'AuthRegScreen'; //--текущий экран

Widget navDrawer(context) => Drawer(

  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(  //шапка в выдвигающимся шкафу
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/logo_pizza.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/profileScreen');
                          },
                          icon: const Icon(
                            Icons.portrait_outlined,
                            size: 30,
                          ),
                          tooltip: 'Профиль',
                        ),
                        Text('Профиль',style: Theme.of(context).textTheme.bodyText1,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.accessibility,color: iconBrownColor,),
        title: Text('Авторизация / Регистрация',style: Theme.of(context).textTheme.bodyText1,),
        onTap: (){
          Navigator.pop(context);
          if (currentScreen=='MainScreen') {
            currentScreen='AuthRegScreen';
            Navigator.pushNamed(context, '/');
          }
        },
      ),
      const Divider(color: iconBrownColor,indent: 20,endIndent: 20,),
      ListTile(
        title: Text('Главная страница',style: Theme.of(context).textTheme.bodyText1,),
        onTap: (){
          Navigator.pop(context);
          if (currentScreen=='AuthRegScreen') {
            currentScreen='MainScreen';
            Navigator.pushNamed(context, '/mainScreen');
          }
        },
        leading: const Icon(Icons.local_pizza,color: iconBrownColor,),
      ),
      ListTile(
        title: Text('Калькулятор пиццы',style: Theme.of(context).textTheme.bodyText1,),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/pizzaCalc');
        },
        leading: const Icon(Icons.calculate,color: iconBrownColor,),
      ),
      const Divider(color: iconBrownColor,indent: 20,endIndent: 20,),
      ListTile(
        leading: const Icon(Icons.settings,color: iconBrownColor,),
        title: Text('Настройки',style: Theme.of(context).textTheme.bodyText1,),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settingsScreen');
        },
      )
    ],
  ),
);