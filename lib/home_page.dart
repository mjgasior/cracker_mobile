import 'package:flutter/material.dart';

import 'markers_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Cracker app',
          style: Theme.of(context).textTheme.subtitle1,
        )),
        body: const MarkersList());
  }
}
