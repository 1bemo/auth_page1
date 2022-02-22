import 'package:flutter/material.dart';

//--color[900]
const _colorOrangeDeep = Color(0xffe65100);

//--color dark brown
const _colorBrownDark = Color(0xff4e342e);

//drawer
Widget navDrawer(context) => Drawer(

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
                        const Text('Профиль',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal
                        ),),
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
        leading: const Icon(Icons.accessibility,color: _colorBrownDark,),
        title: const Text('Авторизация / Регистрация',style: TextStyle(color: _colorBrownDark),),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/');
        },
      ),
      const Divider(color: _colorBrownDark,indent: 20,endIndent: 20,),
      ListTile(
        title: const Text('Главная страница',style: TextStyle(color: _colorBrownDark),),
        onTap: (){
          Navigator.pop(context);
        },
        leading: const Icon(Icons.local_pizza,color: _colorBrownDark,),
      ),
      ListTile(
        title: const Text('Калькулятор пиццы',style: TextStyle(color: _colorBrownDark),),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/pizzaCalc');
        },
        leading: const Icon(Icons.calculate,color: _colorBrownDark,),
      ),
      const Divider(color: _colorBrownDark,indent: 20,endIndent: 20,),
      ListTile(
        leading: const Icon(Icons.settings,color: _colorBrownDark,),
        title: const Text('Настройки',style: TextStyle(color: _colorBrownDark),),
        onTap: (){
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settingsScreen');
        },
      )
    ],
  ),
);

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: RichText(
              text: const TextSpan(
                  children: [
                    TextSpan(text: 'PIZZA ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'Главная страница')
                  ],
              ),
            ),
            actions: [
              IconButton(
                tooltip: 'Уведомления', //при зажатии тапа
                onPressed: (){},
                icon: const Icon(Icons.notifications_active)
              )
            ],
            backgroundColor: _colorOrangeDeep,
            toolbarHeight: 50,
          ),
          drawer: navDrawer(context),
          body: const Center(child: Text('Главная страница с новостями и акциями')),
      );
  }
}
