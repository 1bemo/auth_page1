import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//ф-я фетчФото, возвращающая объект класса Альбом (Футуре) синхронная
Future<Photo> fetchPhoto() async {
  //в переменную записывается запрос json по ссылке синхронно
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos/3'));

  if (response.statusCode == 200) { //при статусе кода - 200 (успешно)
    //возвращает обращение к методу фромДжейсон, в который передается параметр респонс - боди
    return Photo.fromJson(jsonDecode(response.body));
  } else {
    //иначе возвращает сообщение об ошибке
    throw Exception('Failed to load album');
  }
}

//класс Фото
class Photo {
  //переменные становятся константными при инициализации
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  //обязательное заполнение переменных при создании класса (конструктор)
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

  //метод принимающий объект jsonDecode(подключаемый dart:convert)
  factory Photo.fromJson(Map<String, dynamic> json) {
    //возвращает объект, типа Фото, с заполнением обязательных переменных данными из запроса json
    //грубо говоря - привязываем наши ключи к значениям из удаленного json файла
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl']
    );
  }
}

//основной стейтфул виджет
class NetworkingScreenTest extends StatefulWidget {
  const NetworkingScreenTest({Key? key}) : super(key: key);

  @override
  State<NetworkingScreenTest> createState() => _NetworkingScreenTestState();
}
class _NetworkingScreenTestState extends State<NetworkingScreenTest> {
  //объявляем переменную futurePhoto типа Футуре<Фото>
  //late - отложенная загрузка
  late Future<Photo> futurePhoto;

  //единоразовая загрузка данных в переменную futurePhoto при инициализации приложения
  @override
  void initState() {
    super.initState();
    futurePhoto = fetchPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          //виджет ФьючерБилдер с типом Фото
          child: FutureBuilder<Photo>(
            //в параметр фьючер кладем переменную фьючерФото, в ктр поместили результат ф-ии фетчФото()
            future: futurePhoto,
            //в параметр билдер кладем ф-ю. С параметрами контекст и снапшот (сс)
            builder: (context, ss) {
              //если у сс параметр хэсДата == истина
              if (ss.hasData)  {
                return Text(ss.data!.thumbnailUrl);  //то вернутьвиджет Текст(сс.дата!(защита от нулл).тайтл)
              } else if (ss.hasError) { //иначе если у сс параметр хэсЕррор == истина
                return Text('${ss.error}'); //то вернуть виджет Текст(с сообщением о конкретной ошибке)
              }
              //если ни одно из условий не совпало, показывать кольцо загрузки
              return const CircularProgressIndicator();
            }
          ),
        ),
      ),
    );
  }
}
