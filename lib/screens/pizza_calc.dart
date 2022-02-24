import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:auth_page/utils/global_theme.dart';

class PizzaCalc extends StatefulWidget {
  const PizzaCalc({Key? key}) : super(key: key);

  @override
  _PizzaCalcState createState() => _PizzaCalcState();
}

enum Sauces {hot, sweetAndSour, cheese}

class _PizzaCalcState extends State<PizzaCalc> {
  Sauces? _currentSauce = Sauces.hot; //соус по умолчанию
  bool _switchAddCheese = true; //доп сыр
  double _sliderVal = 5;  //шаг слайдера как ориентир размера пиццы
  bool _slim = false; //тонкое тесто
  int _stoim = 0; //общая стоимость

  //подсчет стоимости
  int _stoimost() {
    int _dopStoim = _sliderVal.round();

    //доп стоимость за размер
    switch (_dopStoim) {
      case 0:
        _dopStoim += 50;
        break;
      case 5:
        _dopStoim += 95;
        break;
      case 10:
        _dopStoim += 140;
        break;
      case 15:
        _dopStoim += 185;
        break;
    }

    //доп стоимость за вид соуса
    switch (_currentSauce) {
      case Sauces.hot:
        _dopStoim += 20;
        break;
      case Sauces.sweetAndSour:
        _dopStoim += 30;
        break;
      case Sauces.cheese:
        _dopStoim += 45;
        break;
      default:
        break;
    }

    _stoim = _dopStoim + 200;

    if (_slim) _stoim += 40;  //тонкое тесто + 40р
    if (_switchAddCheese) _stoim += 50; //доп сыр + 50р



    return _stoim;
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
          text: const TextSpan(
              children: [
                TextSpan(text: 'PIZZA ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                TextSpan(text: 'Калькулятор')
              ]
          ),
        ),
          backgroundColor: Colors.orange[900],
          toolbarHeight: 50,),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
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
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Column(
                      children: [
                        //текст калькулятор пиццы
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Калькулятор пиццы',
                            style: Theme.of(context).textTheme.headline3
                          ),
                        ),

                        //текст выберите параметры
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: const Text(
                            'Выберите параметры:',
                            style: TextStyle(
                                fontSize: 16,
                                color: colorBrownDark,
                                fontWeight: FontWeight.w600),
                          ),
                        ),

                        //переключатель обычного и тонкого теста
                        SlidingSwitch(
                          value: false,
                          width: 300,
                          onChanged: (bool val) {
                            _slim = val;
                            setState(() {
                              _stoimost();
                            });
                          },
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
                          buttonColor: Theme.of(context).colorScheme.primary,
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
                                  color: colorBrownDark,
                                  fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.left
                            ),
                        ),

                        //Слайдер
                        Slider(
                          activeColor: Theme.of(context).colorScheme.primary,
                          inactiveColor: const Color(0xFFc2b0a7),
                          value: _sliderVal,
                          max: 15,
                          divisions: 3,
                          label: sizePizzaText(_sliderVal),
                          onChanged: (double val) {
                            setState(() {
                              _sliderVal = val;
                              _stoimost();
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
                                color: colorBrownDark,
                                fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),

                        RadioListTile<Sauces>(
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: const Text('Острый', style: TextStyle(color: colorBrownDark),),
                            value: Sauces.hot,
                            groupValue: _currentSauce,
                            onChanged: _selectSauce,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Container(
                            //width: 200,
                            height: 1,
                            color: const Color(0xFFc2b0a7),
                          ),
                        ),
                        RadioListTile<Sauces>(
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: const Text('Кисло-сладкий', style: TextStyle(color: colorBrownDark),),
                            value: Sauces.sweetAndSour,
                            groupValue: _currentSauce,
                            onChanged: _selectSauce,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Container(
                            width: 200,
                            height: 1,
                            color: const Color(0xFFc2b0a7),
                          ),
                        ),
                        RadioListTile<Sauces>(
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: const Text('Сырный',  style: TextStyle(color: colorBrownDark),),
                            value: Sauces.cheese,
                            groupValue: _currentSauce,
                            onChanged: _selectSauce,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -3.0),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Container(
                            width: 200,
                            height: 1,
                            color: const Color(0xFFc2b0a7),
                            margin: const EdgeInsets.only(bottom: 10),
                          ),
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
                                color: colorBrownDark,
                              ),
                              const Text('Дополнительный сыр',
                                style: TextStyle(
                                    color: colorBrownDark
                                ),
                              ),
                              Switch(
                                  activeColor: Theme.of(context).colorScheme.primary,
                                  value: _switchAddCheese,
                                  onChanged: (val){
                                    setState(() {
                                      _switchAddCheese = !_switchAddCheese;
                                      _stoimost();
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),

                        //текст стоимость
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          width: 300,
                          child: const Text(
                              'Стоимость:',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: colorBrownDark,
                                  fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),

                        //окно с итоговой стоимостью
                        Container(
                          width: 300,
                          height: 34,
                          decoration: const BoxDecoration(
                              color: Color(0xfff0dfd5),
                              borderRadius: BorderRadius.all(Radius.circular(36))
                          ),
                          child: Center(
                            child: Text(
                                  '${_stoimost().toString()} руб',
                                  style: const TextStyle(
                                      color: colorBrownDark
                                  ),
                                ),
                          ),
                        ),

                        //кнопка заказать
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 30),
                          width: 154,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: const Text('Заказать', style: TextStyle(fontSize: 16),),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.primary,
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
