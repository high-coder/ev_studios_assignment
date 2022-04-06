import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/currentState.dart';

class ApiCallHomePage extends StatefulWidget {
  const ApiCallHomePage({Key? key}) : super(key: key);

  @override
  State<ApiCallHomePage> createState() => _ApiCallHomePageState();
}

class _ApiCallHomePageState extends State<ApiCallHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    _instance.getData();
  }

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    print(_instance.apiData.length);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              itemCount: _instance.apiData.length,
              itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.red,
                        width: 40,
                        height: 100,
                      );

                    }
                  ),
        ),
      ),
    );
  }
}
