import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String readMarkers = """
    {
    markers {
      _id
      latitude
      longitude
      imageFilename
      polish {
        name
        description
      }
      english {
        name
        description
      }
    }
  }
""";

class MarkersList extends StatelessWidget {
  const MarkersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(readMarkers),
        ),
        builder: (QueryResult result,
            {Future<QueryResult> Function(FetchMoreOptions)? fetchMore,
            Future<QueryResult?> Function()? refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.data == null) {
            return const Text('No data');
          }

          return ListView.builder(
            itemCount: result.data?['markers'].length,
            itemBuilder: (context, index) {
              final marker = result.data?['markers'][index]['polish']['name'];
              return Text(marker);
            },
          );
        });
  }
}
