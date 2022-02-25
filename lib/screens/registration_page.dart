import 'package:auth_page/utils/global_theme.dart';
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

    return Scaffold(
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
                          Icons.account_circle_rounded,color: colorBrownDark,
                        ),
                      ),
                      Text(
                        'Регистрация',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),

                //Серая полоса
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 7),
                  height: 2,
                  color: colorBrownDark,
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
                    Text(
                      'Телефон',
                      style: Theme.of(context).textTheme.headline1,
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
                  Text(
                    'Почта',
                    style: Theme.of(context).textTheme.headline1,
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
                  margin: const EdgeInsets.only(bottom: 15),
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
                      primary: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    child: const Text('Вырнуться назад', style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      decoration: TextDecoration.underline
                    ),),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
