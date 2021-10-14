
import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:graphql_tut/home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  late TextEditingController cityNameCont ;
  late String cityName = "Varanasi";
  @override
  void initState() {
    cityNameCont = TextEditingController(text:cityName );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final HttpLink link = HttpLink( "https://graphql-weather-api.herokuapp.com/");

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link, cache: GraphQLCache(),
        // The default store is the InMemoryStore, which does NOT persist to disk

      ),
    );
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Search Country weather"),
      ),
      body:  SingleChildScrollView(
        child:  Column(
          children: [
             Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                    controller: cityNameCont,
                    onChanged: (String val){
                      cityName = val;
                    },
                ),
                 ),
                 MaterialButton(
                  child:  const Text("Search"),
                  onPressed: (){
                    // client.notifyListeners();
                    // print(cityName);
                    setState(() {

                    });

                  }
                )
              ],
            ),
            GraphQLProvider(
              client: client,
              child: HomePage(cityKeyword: cityName),
            )
          ],
        ),
      )

    );
  }
}
