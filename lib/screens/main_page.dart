import 'package:auth_page/utils/drawer_settings.dart';
import 'package:flutter/material.dart';

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
            backgroundColor: Theme.of(context).colorScheme.primary,
            toolbarHeight: 50,
          ),
          drawer: navDrawer(context),
          body: Center(child: Text(
              'Главная страница с новостями и акциями',
              style: Theme.of(context).textTheme.bodyText1,
          )),
      );
  }
}
