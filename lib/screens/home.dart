import 'package:flutter/material.dart';

import 'markers_list.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isProgressing = false;
  bool isLoggedIn = false;
  String errorMessage = '';
  String? name;

  @override
  void initState() {
    initAction();
    super.initState();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (isProgressing)
                  const CircularProgressIndicator()
                else if (!isLoggedIn)
                  ElevatedButton(
                    onPressed: loginAction,
                    child: const Text('Login | Register'),
                  )
                else
                  Text('Welcome $name'),
                if (isLoggedIn)
                  ElevatedButton(
                    onPressed: logoutAction,
                    child: const Text('Logout'),
                  )
              ], // <Widget>[]
            ),
            const Expanded(child: MarkersList())
          ],
        ));
  }

  setSuccessAuthState() {
    setState(() {
      isProgressing = false;
      isLoggedIn = true;
      name = AuthService.instance.idToken?.name;
    });

    // CoffeeRouter.instance.push(MenuScreen.route());
  }

  setLoadingState() {
    setState(() {
      isProgressing = true;
      errorMessage = '';
    });
  }

  Future<void> loginAction() async {
    setLoadingState();
    final message = await AuthService.instance.login();
    if (message == 'Success') {
      setSuccessAuthState();
    } else {
      setState(() {
        isProgressing = false;
        errorMessage = message;
      });
    }
  }

  Future<void> logoutAction() async {
    setLoadingState();
    await AuthService.instance.logout();
    setState(() {
      isProgressing = false;
      isLoggedIn = false;
    });
  }

  initAction() async {
    setLoadingState();
    final bool isAuth = await AuthService.instance.init();
    if (isAuth) {
      setSuccessAuthState();
    } else {
      setState(() {
        isProgressing = false;
      });
    }
  }
}
