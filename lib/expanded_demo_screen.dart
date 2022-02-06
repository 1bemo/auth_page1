import 'package:flutter/material.dart';

class ExpandedDemoScreen extends StatelessWidget {
  const ExpandedDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(), //--бар сверху
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded( //--перенос текста
                      child: Text("очень очень очень очень очень очень очень "
                          "очень очень длинный текст")
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                    height: 100,
                    color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                    height: 100,
                    color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                    height: 100,
                    color: Colors.blue,
                    ),
                  )
                ],
              ),
              Row(
                children:  [

                  const Expanded(
                    flex: 3,  //--3 части в ширину
                      child: TextField(
                        decoration: InputDecoration(  //--декорация текстового поля (input - в поле ввода)
                          prefixIcon: Icon(Icons.add_box_outlined), //--иконка префикса
                        ),
                      ),
                  ),
                  Expanded(
                    flex: 1,  //--одна часть ширину
                      child: ElevatedButton(onPressed: () {},
                          child: const Text("Регистрация")
                      ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}