import 'package:flutter/material.dart';

//--color[900]
const _colorOrangeDeep = Color(0xffe65100);

//--color dark brown
const _colorBrownDark = Color(0xff4e342e);

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  int _currentIndex = 0;
  void _onItemTapped(int val) {
    setState(() {
      _currentIndex = val;
    });
  }
  static const List<Widget> _listTexts = <Widget>[
    Text(
      'Основные настройки приложения',
      style: TextStyle(color: _colorBrownDark),
    ),
    Text(
      'Настройки отображения',
      style: TextStyle(color: _colorBrownDark),
    ),
    Text(
      'О приложении. Версия',
      style: TextStyle(color: _colorBrownDark),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.domain_verification),
            label: 'Основные',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_display),
            label: 'Отображение',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'О приложении',
          ),
        ],
        backgroundColor: _colorOrangeDeep,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, 0.4),
        onTap: _onItemTapped
      ),
      appBar: AppBar(
        title: const Text('Настройки',style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18
        ),),
        backgroundColor: _colorOrangeDeep,
        toolbarHeight: 50,
        actions: [
          TextButton(
            onPressed: (){},
            child: const Text(
              'Сброс',
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4)),
            ),
          )
        ],
      ),
      body: Center(child: _listTexts.elementAt(_currentIndex)),
    );
  }
}
