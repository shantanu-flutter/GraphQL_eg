

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_tut/Model/base_class.dart';

import 'Constants.dart';

class HomePage extends StatefulWidget {
  String? cityKeyword;

   HomePage({Key? key , this.cityKeyword }):super(key: key);


  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? readQuery ;

  @override
  void initState() {
    // TODO: implement initState
    print("Passed city keyword ${widget.cityKeyword}");
    readQuery = query.replaceAll("#{cityName}", widget.cityKeyword??"");
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Container(
        child: Query(
          options: QueryOptions(
            document: gql(readQuery??""), // this is the query string you just created
            // variables: {
            //   'nRepositories': 50,
            // },
            // pollInterval: Duration(seconds: 10),
          ),
          // Just like in apollo refetch() could be used to manually trigger a refetch
          // while fetchMore() can be used for pagination purpose
          builder: (QueryResult result, { VoidCallback? refetch, FetchMore? fetchMore }) {
            if (result.hasException) {
              return Center(child: Text(result.exception.toString()));
            }

            if (result.isLoading) {
              return const Center(child: Text('Loading'));
            }

            // it can be either Map or List
            BaseClass  retModel = BaseClass.fromJson(result.data!['getCityByName']);
            debugPrint("Base class is ${retModel}");

            print(result.data);
            return  Center(
              child:  Card(
                child:  Column(
                   children:[
                     Text("${retModel.id}"),
                     Text("${retModel.name}"),
                     Text("${retModel.country}")
                  ]
                ),
              ),
            );
          },
        ),
      );
  }
}
