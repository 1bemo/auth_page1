import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  _PizzaCalcState createState() => _PizzaCalcState();
}

enum Sauces {hot, sweetAndSour, cheese}

class _PizzaCalcState extends State<PizzaCalc> {

  //соус по умолчанию
  Sauces? _currentSauce = Sauces.hot;

  //шаг слайдера
  double _sliderVal = 5;

  //ф-я подписи слайдера
  String sizePizzaText (sliderVal) {
    String _returned = '${sliderVal.round()+20} см';
    if (sliderVal==0) {
      _returned = "Маленькая ${_sliderVal.round()+20} см";
    }
    if (sliderVal==15) {
      _returned = "Огромная ${_sliderVal.round()+20} см";
    }
    return _returned;
  }

  void _selectSauce(Sauces? val) {
    setState(() {
      _currentSauce = val;
    });
  }

  bool _switchAddCheese = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/bg1.jpg'))),
            child: Column(
              children: [
                //картинка пиццы
                Container(
                  alignment: Alignment.centerRight,
                  child: const Image(
                    width: 100,
                    image: AssetImage('assets/pizza_animation.gif'),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      //текст калькулятор пиццы
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          'Калькулятор пиццы',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(92, 37, 7, 0.8),
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      //текст выберите параметры
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: const Text(
                          'Выберите параметры:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(92, 37, 7, 0.8),
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      //переключатель обычного и тонкого теста
                      SlidingSwitch(
                        value: false,
                        width: 300,
                        onChanged: (_) {},
                        height: 34,
                        animationDuration: const Duration(milliseconds: 50),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "Обычное тесто",
                        textOn: "Тонкое тесто",
                        colorOn: const Color(0xffffffff),
                        colorOff: const Color(0xffffffff),
                        background: const Color(0xfff0dfd5),
                        buttonColor: const Color(0xFFc96630),
                        inactiveColor: const Color.fromRGBO(0, 0, 0, 0.4),
                      ),

                      //текст размер
                      Container(
                        width: 300,
                          margin: const EdgeInsets.only(top: 25),
                          child: const Text(
                            'Размер:',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(92, 37, 7, 0.8),
                                fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left
                          ),
                      ),

                      //Слайдер
                      Slider(
                        activeColor: const Color(0xFFc96630),
                        inactiveColor: const Color(0xFFc2b0a7),
                        value: _sliderVal,
                        max: 15,
                        divisions: 3,
                        label: sizePizzaText(_sliderVal),
                        onChanged: (double val) {
                          setState(() {
                            _sliderVal = val;
                          });
                        },
                      ),

                      //текст соус
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        child: const Text(
                            'Соус:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(92, 37, 7, 0.8),
                              fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),

                      RadioListTile<Sauces>(
                          activeColor: const Color(0xFFc96630),
                          title: const Text('Острый', style: TextStyle(color: Color.fromRGBO(92, 37, 7, 0.8)),),
                          value: Sauces.hot,
                          groupValue: _currentSauce,
                          onChanged: _selectSauce,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      Container(
                        width: 200,
                        height: 1,
                        color: const Color(0xFFc2b0a7),
                      ),
                      RadioListTile<Sauces>(
                          activeColor: const Color(0xFFc96630),
                          title: const Text('Кисло-сладкий', style: TextStyle(color: Color.fromRGBO(92, 37, 7, 0.8)),),
                          value: Sauces.sweetAndSour,
                          groupValue: _currentSauce,
                          onChanged: _selectSauce,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      Container(
                        width: 200,
                        height: 1,
                        color: const Color(0xFFc2b0a7),
                      ),
                      RadioListTile<Sauces>(
                          activeColor: const Color(0xFFc96630),
                          title: const Text('Сырный',  style: TextStyle(color: Color.fromRGBO(92, 37, 7, 0.8)),),
                          value: Sauces.cheese,
                          groupValue: _currentSauce,
                          onChanged: _selectSauce,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                      ),
                      Container(
                        width: 200,
                        height: 1,
                        color: const Color(0xFFc2b0a7),
                        margin: const EdgeInsets.only(bottom: 10),
                      ),
                      
                      //Доп-опция
                      Container(
                        width: 300,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xfff0dfd5),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Icon(
                                Icons.local_pizza_outlined,
                              color: Color.fromRGBO(92, 37, 7, 0.8),
                            ),
                            const Text('Дополнительный сыр',
                              style: TextStyle(
                                  color: Color.fromRGBO(92, 37, 7, 0.8)
                              ),
                            ),
                            Switch(
                                activeColor: const Color(0xFFc96630),
                                value: _switchAddCheese,
                                onChanged: (val){
                                  setState(() {
                                    _switchAddCheese = !_switchAddCheese;
                                  });
                                }
                            ),
                          ],
                        ),

                      ),

                      //текст стоимость
                      Container(
                        width: 300,
                        child: const Text(
                            'Стоимость:',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(92, 37, 7, 0.8),
                                fontWeight: FontWeight.w600
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),

                      //кнопка заказать
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 154,
                        height: 42,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: const Text('Заказать', style: TextStyle(fontSize: 16),),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
