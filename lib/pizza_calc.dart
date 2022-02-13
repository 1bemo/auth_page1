import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  _PizzaCalcState createState() => _PizzaCalcState();
}

class _PizzaCalcState extends State<PizzaCalc> {

  double _sliderVal = 5;

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

                      Container(
                        alignment: Alignment.centerRight,
                        width: 290,
                        child: Column(
                          children: const [
                            Text('some')
                          ],
                        ),
                      )
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
