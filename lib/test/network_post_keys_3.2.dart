import 'package:flutter/material.dart'; //материал дизайн
import 'dart:async';  //дял синхронных действий
import 'package:http/http.dart' as http;  //хттп
import 'dart:convert';  //для jsonDecode

//класс Пост
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  //конструктор
  Post ({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  //привязваем ключи json к классу
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}

//синхронная ф-я возвращающая объект класса Пост
Future<Post> fetchPost() async {
  final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (res.statusCode == 200) {  //ели статусКод 200 (все ок)
    return Post.fromJson(jsonDecode(res.body));
  } else {  //иначе сообщение об ошибки загрузки поста
    throw Exception('Ошибка загрузки поста');
  }
}

//стейтфул виджет
class NetworkPostForKeys32 extends StatefulWidget {
  const NetworkPostForKeys32({Key? key}) : super(key: key);

  @override
  State<NetworkPostForKeys32> createState() => _NetworkPostForKeys32State();
}
class _NetworkPostForKeys32State extends State<NetworkPostForKeys32> {
  late Future<Post> futurePost;

  //при инициализации приложения
  @override
  void initState() {
    super.initState();
    //в переменную futurePost закидываем результат ф-ии fetchPost()
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Кейс 3.2')
          ),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Text(
                      'Заголовок:',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                FutureBuilder<Post>(
                  future: futurePost,
                  builder: (context, ss) {
                    if (ss.hasData) {
                      return Container(margin: const EdgeInsets.only(top: 10),child: Text(ss.data!.title,textAlign: TextAlign.center,));
                    } else if (ss.hasError) {
                      return Text('${ss.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: const Text(
                      'Содержимое:',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    )
                ),
                FutureBuilder<Post>(
                  future: futurePost,
                  builder: (context, ss) {
                    if (ss.hasData) {
                      return Container(margin: const EdgeInsets.only(top: 10),child: Text(ss.data!.body,textAlign: TextAlign.center,));
                    } else if (ss.hasError) {
                      return Text('${ss.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
