import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static final List<Widget> _listTexts = <Widget>[
    Column(
      children: [
        const Text(
          'Основные настройки приложения',
          style: TextStyle(color: colorBrownDark),
        ),
        const Divider(color: Colors.black,height: 2,),
        Text(
          'Pushster Text Google Fonts',
          style: GoogleFonts.pushster(
              color: Colors.black
          ),
        ),
        Text(
          'Lato Text Google Fonts',
          style: GoogleFonts.getFont(
              'Lato',
              color: Colors.black
          ),
        ),
        Text(
          'Smooch Text with Combine',
          style: GoogleFonts.smooch(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 5
              )
          ),
        ),
      ],
    ),
    const Text(
      'Настройки отображения',
      style: TextStyle(color: colorBrownDark),
    ),
    const Text(
      'О приложении. Версия',
      style: TextStyle(color: colorBrownDark),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
