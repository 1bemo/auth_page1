import 'dart:async'; //на всякий случай дял асинхронных ф-ий
import 'dart:io'; //для работы типа <File>
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';  //для работы getApplicationDocumentsDirectory - 21 строка

class FilesDemoScreen extends StatelessWidget {
  const FilesDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Чтение и Запись файлов',
      home: FlutterDemo(storage: CounterStorage()), //стейтфул виджет с запрашиваемым параметром сторейдж, типа КоунтерСторейдж, ктр объявляем ниже
    );
  }
}

//класс КоунтерСторейдж с геттерами и методами
class CounterStorage {
  //геттер возвращает путь до папки в виде строки (будущей)
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory(); //применяет способности импортированной ф-ии

    return directory.path;  //возвращает путь до папки
  }

  //геттер возвразает путь в виде строки (будущей) до всего файла, используя геттер локалПатч
  Future<File> get _localFile async {
    final path = await _localPath;  //использует геттер из этого же класса и помещаем его возвратное значение в переменную
    return File('$path/counter.txt'); //приписывает к нему имя файла и возвращает все содержимое
  }

  //метод возвращает значение типа Инт после парсинга строки полученной из файла
  Future<int> readCounter() async {
    //используем обработчик непредвиденных ситуаций, мало ли чего с файлом или в файле
    try {
      final file = await _localFile;  //в переменную помещаем возвратное значение из геттера этого же класса

      //Читаем данные файла
      final contents = await file.readAsString(); //в переменную помещаем возвратку в виде строки от метода ридАсСтринг для файла

      return int.parse(contents); //возвращаем парсинг полученной строки в тип Инт
    } catch (e) {
      return 0; //если какая ошибка возвращаем 0 (тоже тип Инт)
    }
  }

  //метод возвращает тип Файл (подключенный импортом)
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;  //в переменну помещаем возвратку от метода этого же класса докалФайл. Тип Файл (полный пусть до файла)

    //Запись в файл
    return file.writeAsString('$counter');  //возвращаем и записываем файл методом врайтАсСтринг значение переменной коунтер (она тип Инт)
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    //Write the variable as a string to the file
    return widget.storage.writeCounter(_counter);
  }

  Future<File> _decrementCounter() {
    setState(() {
      _counter--;
    });

    //Write the variable as a string to the file
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чтение и Запись файлов'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Text(
                'Счетчик кликов: $_counter',
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: _decrementCounter,
                        icon: const Icon(Icons.remove_circle,color: Colors.blue,)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: IconButton(
                          onPressed: _incrementCounter,
                          icon: const Icon(Icons.add_circle,color: Colors.blue,)
                      ),
                    ),
                  ],
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
