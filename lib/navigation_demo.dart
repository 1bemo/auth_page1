import 'package:flutter/material.dart';

class NavigationDemo extends StatefulWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MainScreen(), //при использовании initialRoute нельзя использовать home
      initialRoute: '/',  //задаем стартовый экран по его адресу '/'
      routes: { //маршруты
        '/': (context) =>const MainScreen(),  // имя '/' привязано к классу MainScreen
        '/contacts': (context) => const SecondScreen(), //имя '/contacts' привязано к классу SecondScreen
      },
    );
  }
}

Widget navDrawer(context) => Drawer(  //отдельно вынесенные настройки виджета Drawer (выдвижной панели)
//Обязательно пробрасываем переменную context, для ее использования в ф-ии onTap
  child: ListView(padding: EdgeInsets.zero, children: [ //список с нулевыми отступами
    DrawerHeader( //шапка панели
      decoration: const BoxDecoration(
        color: Colors.blue, //цвет фона
      ),
        child: Container(
          height: 200,  //высота
        ),
    ),
    ListTile( //часть списка
      leading: const Icon(Icons.ad_units), //иконка
      title: const Text('К главной'),  //подпись
      onTap: (){  //ф-я при тапе
        Navigator.pushNamed(  //ф-я pushNamed вкратце - переход по имени адреса '/'
          context,  //передаем context, который пробросили в текущий виджет
          '/',
        );
      },
    ),
    ListTile(
      leading: const Icon(Icons.account_box_sharp),
      title: const Text('К контактам'),
      onTap: (){
        Navigator.pushNamed( //переход по имени '/contacts'
          context,
          '/contacts'
        );
      },
    )
  ],),
);

class MainScreen extends StatelessWidget{ //первыое окно в виде класса
  const MainScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //возвращаем сразу скафолд, без материала
      appBar: AppBar(title: const Text('Главная'),),
      drawer: navDrawer(context), //настройки отдельным виджетом
      body: const Center(
        child: Text('Главная страница'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{ //второй экрна в виде класса
  const SecondScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //сразу скафолд
      appBar: AppBar(title: const Text('Контакты'),),
      drawer: navDrawer(context), //те же настройки
      body: const Center(
        child: Text('Страница с контактами'),
      ),
    );
  }
}
