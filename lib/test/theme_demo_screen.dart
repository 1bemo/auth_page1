import 'package:flutter/material.dart';
import '../utils/strings.dart';

class ThemeDemoApp extends StatelessWidget {
  const ThemeDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyThemeDemoScreen(),
    );
  }
}


//---Оттельно формируем скаффолд
class MyThemeDemoScreen extends StatefulWidget {
  const MyThemeDemoScreen({Key? key}) : super(key: key);

  @override
  _MyThemeDemoScreenState createState() => _MyThemeDemoScreenState();
}

class _MyThemeDemoScreenState extends State<MyThemeDemoScreen> {
  double _currentSliderValue = 20;
  //bool _isDarkTheme = false;

  Widget _navigationDraw() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                 SizedBox(height: 50,width: 50,child: Placeholder(color: Colors.black,)),
                 Text('Навигация по Flutter')
              ],
            ),
          ),
        )
      ],
    ),
  );

  PreferredSizeWidget _appBar() => AppBar(
    title: const Text('Демо темы'),
    actions: [
      IconButton(onPressed: (){}, icon: const Icon(Icons.add_alert)),
      IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
    ],
    backgroundColor: Theme.of(context).colorScheme.secondary,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDraw(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Заголовок', style: Theme.of(context).textTheme.headline5,),
              Container(
                height: 100,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Row(
                children: const [
                  Text('Логин'),
                  Expanded(child: TextField()),
                ],
              ),
              Row(
                children: const [
                  Text('Пароль'),
                  Expanded(child: TextField()),
                ],
              ),
              ElevatedButton(onPressed: (){}, child: const Text('Войти')),
              const Text(Strings.longBodyText),
              Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double val) {
                    setState(() {
                      _currentSliderValue = val;
                    });
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}

