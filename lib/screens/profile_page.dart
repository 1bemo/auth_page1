import 'package:flutter/material.dart';

//--color[900]
const _colorOrangeDeep = Color(0xffe65100);

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
        backgroundColor: _colorOrangeDeep,
        toolbarHeight: 50,
      ),
      body: const Center(
        child: Text('Профиль'),
      ),
    );
  }
}
