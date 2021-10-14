import 'package:flutter/material.dart';
import 'package:graphql_tut/dashboard.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashBoard();
  }
}