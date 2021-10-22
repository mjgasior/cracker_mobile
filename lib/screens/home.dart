import 'package:flutter/material.dart';

import 'markers_list.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Cracker app',
              style: Theme.of(context).textTheme.subtitle1,
            )),
        body: Column(
          children: [
            ElevatedButton(child: const Text('sad'), onPressed: () {
              print('asda');
              final authService = AuthService.instance;
              authService.login();

            },),
            const Expanded(child: MarkersList())
          ],
        ));
  }
}
