import 'package:cracker_mobile/cracker_theme.dart';
import 'package:cracker_mobile/helpers/constants.dart';
import 'package:cracker_mobile/home_page.dart';
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
  static const _apiAddress = 'https://cracker.red/api';
  ValueNotifier<GraphQLClient>? client;

  void initializeClient() {
    final HttpLink httpLink = HttpLink(_apiAddress);
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
    final theme = CrackerTheme.dark();

    print(AUTH0_CLIENT_ID);
    print(AUTH0_DOMAIN);

    if (client == null) {
      return const MaterialApp(home: Text("Loading..."));
    }

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Cracker mobile app',
        theme: theme,
        home: const HomePage(),
      ),
    );
  }
}
