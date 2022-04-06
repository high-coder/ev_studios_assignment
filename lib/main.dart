import 'package:ev_studios_assignment/provider/currentState.dart';
import 'package:ev_studios_assignment/screens/apiCallScreens/apiCallHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CurrentState()),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ApiCallHomePage(),
    ),);
  }
}
