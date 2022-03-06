import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences демо',
      home: MyHomePage(
        title: 'Shared preferences демо'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title; //параметр при определении класса

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //счетчик
  dynamic _cnt = 'Перезагружено'; //счетчик для текущего сеанса
  Color _color = Colors.green;  //цвет оформления приложения

  //____ 1. Вызывается при инициализации приложения
  @override
  void initState() {
    super.initState();
    _loadSettings();   //загружается состояние счетчика из данных
  }

  //_____ 2. Загрузка состояния счетчика из данных
  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      //в переменную помещаем значение counter из данных. Если пусто вставляем 0
      _counter = (prefs.getInt('counter') ?? 0);
      //выгружаем значение сохраненного цвета из данных
      _color = _convertColor(prefs.getString('color') ?? 'green');
    });
  }

  //---ф-я принимающая строку color и возвращающая объект Color, в зависимости от строки
  Color _convertColor(color) {
    Color _returned = Colors.green;
    switch (color) {
      case "green":
        _returned = Colors.green;
        break;
      case "purple":
        _returned = Colors.purple;
        break;
      case "red":
        _returned = Colors.red;
        break;
      case "deepPurple":
        _returned = Colors.deepPurple;
        break;
    }
    return _returned;
  }

  //ф-я меняющая переменную цвета приложения и записывающая значение в данные
  void _changeColor() async {
    final prefs = await SharedPreferences.getInstance();
    String _colorForSave = 'green';
    setState(() {
      if (_color==Colors.green) {
        _color = Colors.purple;
        _colorForSave = 'purple';
      } else if (_color==Colors.purple) {
        _color = Colors.red;
        _colorForSave = 'red';
      } else if (_color==Colors.red) {
        _color = Colors.deepPurple;
        _colorForSave = 'deepPurple';
      } else {
        _color = Colors.green;
        _colorForSave = 'green';
      }
      prefs.setString('color', _colorForSave);
    });
  }

  //_____ 3. Повышение счетчика на 1 и запись значения в данные
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);

      //моя добавка текущего счетчика
      if (_cnt is String) _cnt = 0;
      _cnt++;
    });
  }

  //_____ 4. Понижение счетчика на 1 и запись значения в данные
  void _decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) - 1;
      prefs.setInt('counter', _counter);

      //моя добавка текущего счетчика
      if (_cnt is String) _cnt = 0;
      _cnt++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _decrementCounter,
            icon: const Icon(Icons.remove_circle),
          )
        ],
        backgroundColor: _color,
        title: Text(widget.title),  //берем данные из переменной в виджете MyHomePage
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Суммарный счетчик'
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text('Кооличество кликов за текущий сеанс:'),
            Text(
              '$_cnt',
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: TextButton(
                child: Text('Смена цвета',style: TextStyle(color: _color),),
                onPressed: _changeColor
              ),
            ),
            const Text('(Настройка цвета сохранится после перезапуска)',style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

