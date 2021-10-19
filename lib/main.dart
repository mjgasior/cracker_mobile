import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const CrackerApp());
}

class CrackerApp extends StatefulWidget {
  const CrackerApp({Key? key}) : super(key: key);

  @override
  State<CrackerApp> createState() => _CrackerAppState();
}

class _CrackerAppState extends State<CrackerApp> {
  static const $API_ADDRESS = 'https://cracker.red/api';
  ValueNotifier<GraphQLClient>? client;

  void initializeClient() {
    final HttpLink httpLink = HttpLink($API_ADDRESS);
    ValueNotifier<GraphQLClient> newClient = ValueNotifier(GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ));

    setState(() {
      client = newClient;
    });
  }


  @override
  void initState() {
    initializeClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (client == null) {
      return const MaterialApp(home: Text("Loading..."));
    }

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Cracker mobile app',
        home: const Text('Flutter Demo Home Page'),
      ),
    );
  }
}
