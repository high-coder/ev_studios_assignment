import 'package:ev_studios_assignment/screens/waterAnimationThing/waterAnimationHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'apiCallScreens/apiCallHomePage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WaterThing()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 60,
                            //width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Center(
                                child: Text(
                              "Water Animation",
                              style: GoogleFonts.openSans(color: Colors.black),
                            )),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ApiCallHomePage()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 60,
                            //width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Center(
                                child: Text(
                                  "Api Data",
                                  style: GoogleFonts.openSans(color: Colors.black),
                                )),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
