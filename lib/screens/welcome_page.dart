import 'package:auth_page/screens/pizza_calc.dart';
import 'package:auth_page/screens/profile_page.dart';
import 'package:auth_page/screens/registration_page.dart';
import 'package:auth_page/screens/settings_screen.dart';
import 'package:auth_page/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_page.dart';
import 'main_page.dart';









//-----------------------------в разработке-------------------------------------










//--переменная месенджера
final _messengerKey = GlobalKey<ScaffoldMessengerState>();

//--выбор экрана
String _whatAScreen = '/authregscreen';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<WelcomePageScreen> createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  //--инициализация настроек при старте
  @override
  void initState() {
    super.initState();
    choiceStartScreen();
  }

  //--ф-я выбора экрана
  void choiceStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getInt('registered')==1) {
        _whatAScreen = '/mainScreen';
      }
      _whatAScreen = '/authregscreen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalOrangeTheme(),
      scaffoldMessengerKey: _messengerKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeWidget(),
        '/authregscreen': (context) => const AuthRegScreen(), //привязваем AuthRegScreen к '/'
        '/pizzaCalc': (context) => const PizzaCalc(),
        '/mainScreen': (context) => const MainPageScreen(),
        '/regScreen': (context)=> const RegistrationPage(),
        '/settingsScreen': (context) => const SettingsScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
      },
    );
  }
}

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Click to Start'),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, _whatAScreen);
                  },
                  icon: const Icon(Icons.local_pizza)
              ),
            )
          ],
        ),
      ),
    );
  }
}
