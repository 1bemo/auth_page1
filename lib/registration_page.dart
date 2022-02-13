import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const _borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFeceff1),
        )
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [

                //Регистрация
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.account_circle_rounded,color: Color.fromRGBO(92, 37, 7, 0.7),
                        ),
                      ),
                      const Text(
                        'Регистрация',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(92, 37, 7, 0.7)),
                      ),
                    ],
                  ),
                ),

                //Серая полоса
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 7),
                  height: 2,
                  color: const Color(0xFFc4c4c4),
                ),

                //Текст подсказка
                const Text(
                  'Чтобы зарегистрироваться введите свой номер телефона и почту',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFc4c4c4),
                    fontSize: 16,
                  ),
                ),

                //Текст телефон
                Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 6),
                  child:
                    const Text(
                      'Телефон',
                      style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                ),

                //Ввод телефона
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: _borderStyle,
                    focusedBorder: _borderStyle,
                    prefix: Text('+7 ', style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.4)),),
                  ),
                ),


                //Текст почта
                Container(
                  margin: const EdgeInsets.only(top: 14, bottom: 6),
                  child:
                  const Text(
                    'Почта',
                    style: TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
                  ),
                ),

                //Ввод почты
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: _borderStyle,
                      focusedBorder: _borderStyle,
                  ),
                ),

                //подсказка 1
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 14),
                  child: const Text(
                      'Вам придет четырехзначный код который будет вашим паролем',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Color(0xFFc4c4c4))
                  ),
                ),

                //подсказка 2
                Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: const Text(
                    'Изменить пароль можно будет в личном кабинете после регистрации',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFFc4c4c4)),
                  ),
                ),

                //Кнопка
                SizedBox(
                  width: 154,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('Отправить код', style: TextStyle(fontSize: 16),),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFc96630),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
