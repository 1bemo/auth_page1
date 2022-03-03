import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('Кейс 2.5', style: Theme.of(context).textTheme.headline1,),
                Text('20 кликабельных элементов',style: Theme.of(context).textTheme.headline2,),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 10
                        )
                      ],
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                            width: 2
                        )
                    ),
                    width: 300,
                    height: 300,
                  margin: const EdgeInsets.all(10),
                  child: const ClickableList1()
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    'Кликабельные элементы из списка "users", сформированного из классов, типа "User"',
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  )
                ),
                Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Theme.of(context).colorScheme.primary,
                              blurRadius: 10
                          )
                        ],
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                            width: 2
                        )
                    ),
                    width: 300,
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    child: const ClickableUsersList()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//-----ClickableList1
class ClickableList1 extends StatefulWidget {
  const ClickableList1({Key? key}) : super(key: key);

  @override
  _ClickableList1State createState() => _ClickableList1State();
}
class _ClickableList1State extends State<ClickableList1> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).colorScheme.secondary
              ),
              child: ListTile(
                title: Text('Элемент ${i+1}'),
                selected: i == _selectedIndex,
                selectedColor: Theme.of(context).colorScheme.primary,
                onTap: (){
                  setState(() {
                    _selectedIndex = i;
                  });
                },
              ),
            );
          }
    );
  }
}

//-----Класс Юзер и лист с примерами типа Юзер
class User {
  String name = '';
  String phone = '';

  User(String n, String p) {
   name = n;
   phone = p;
  }
}
List users = <User>[
  User('Вася', '89698987485'),
  User('Петя', '89687478856'),
  User('Катя', '82695658974'),
  User('Маша', '89996665254'),
  User('Леша', '87454521254'),
  User('Ваня', '82326569871'),
  User('Коля', '85653231346'),
  User('Миша', '864697*5462'),
  User('Галя', '85457879898'),
];

//-------------ClickableUsersList
class ClickableUsersList extends StatefulWidget {
  const ClickableUsersList({Key? key}) : super(key: key);

  @override
  State<ClickableUsersList> createState() => _ClickableUsersListState();
}

class _ClickableUsersListState extends State<ClickableUsersList> {
  int _select = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Theme.of(context).colorScheme.secondary
            ),
            child: ListTile(
              selectedColor: Theme.of(context).colorScheme.primary,
              selected: i==_select,
              title: Text('Имя: ${users[i].name}\nТелефон: ${users[i].phone}'),
              onTap: (){
                setState(() {
                  _select = i;
                });
              }
            ),
          );
        },
    );
  }
}
