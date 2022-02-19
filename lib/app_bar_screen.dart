import 'package:flutter/material.dart';

class AppBarScreen extends StatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  _AppBarScreenState createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {

  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle = TextButton.styleFrom( //переменная стиля кнопки-текста
        primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('demo appbar'), //заголовок аппбара
          actions: <Widget>[  //кнопки, типа виджет
            IconButton( //кнопка-иконка
              tooltip: 'comment', //подсказка при удержании
              onPressed: (){},  //событие при нажатии (тапе)
              icon: const Icon(Icons.restore)
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.accessibility_new)
            ),
            TextButton( //кнопка-текст
              style: buttonStyle, //вставляем стиль из переменной
              onPressed: (){},
              child: const Text('profile')
            ),
          ],
        ),
        body: const Center(child: Text('content')),
      ),
    );
  }
}
