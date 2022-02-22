import 'package:flutter/material.dart';

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

  Widget _navigationDraw() => const Drawer(
    backgroundColor: Colors.amber,
  );

  PreferredSizeWidget _appBar() => AppBar(
    backgroundColor: Colors.amberAccent,
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

