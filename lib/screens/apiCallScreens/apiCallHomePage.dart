import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_studios_assignment/screens/apiCallScreens/profilePage.dart';
import 'package:ev_studios_assignment/utils/our_colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/currentState.dart';
import '../../utils/our_text_styles.dart';
import '../../utils/shimmerAnimation.dart';

class ApiCallHomePage extends StatefulWidget {
  const ApiCallHomePage({Key? key}) : super(key: key);

  @override
  State<ApiCallHomePage> createState() => _ApiCallHomePageState();
}

class _ApiCallHomePageState extends State<ApiCallHomePage> {


  late Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    data = _instance.getData();
  }

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    print(_instance.apiData.length);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Consumer<CurrentState>(
            builder: (context, _, __) {
              return FutureBuilder(
                future:data,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("loading.....");
                    case ConnectionState.waiting:
                      return ShimmerForCategories(
                          size.height / 5.2, size.width - 20);
                    case ConnectionState.done:
                      if(_instance.apiData.isNotEmpty) {
                        return  ListView.builder(
                            itemCount: _instance.apiData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    bottom: 15, left: 10, right: 10, top: 15),
                                decoration: BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Colors.black.withOpacity(0.15),
                                            width: 1))),
                                margin: EdgeInsets.only(
                                  bottom: 20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      //mainAxisAlignment: ,
                                      children: [

                                        GestureDetector(
                                          onTap: () {
                                            // here navigate the user to the user profile page
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userData: _instance.apiData[index],)));
                                          },
                                            child: CircleAvatar(radius: 30,)),
                                        SizedBox(width: 19,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(_instance.apiData[index].nameData?.firstName?? "",style: GoogleFonts.openSans(color: Colors.black,fontSize: 15),),
                                            Container(
                                              width: 260,
                                              child: Text(
                                                _instance.apiData[index].occupation ?? "No occupation specified",
                                                style: GoogleFonts.openSans(
                                                    fontSize: 17,
                                                    color: MyColors.appThemeBlueText,
                                                    fontWeight: FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //title of the post

                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: size.height/2,
                                      width: size.width,
                                      child: CachedNetworkImage(
                                        imageUrl: _instance.apiData[index].images?.main ?? "",fit: BoxFit.contain,
                                      ),
                                    ),

                                    // Flexible(
                                    //   child: Text("Ends on ${_instance.postIds[index].deadLine.day} /${_instance.postIds[index].deadLine.month} /${_instance.postIds[index].deadLine.year}",
                                    //     style: GoogleFonts.openSans(fontStyle: FontStyle.italic,color: Colors.white),),
                                    // ),

                                    // Flexible(
                                    //   child: Text("₹ ${_instance.postIds[index].donatedTillNow} Raised",
                                    //     style: GoogleFonts.openSans(fontStyle: FontStyle.italic,color: Colors.red),),
                                    // ),

                                    // Builder(
                                    //   builder: (context) {
                                    //     double  valueToShow = 0;
                                    //     valueToShow = _instance.postIds[index].donatedTillNow / _instance.postIds[index].totalDonationNeeded;
                                    //     if(valueToShow >1) {
                                    //       valueToShow = 1;
                                    //     } else if(valueToShow <0) {
                                    //       valueToShow = 0;
                                    //     }
                                    //
                                    //
                                    //     return LinearPercentIndicator(
                                    //       width: MediaQuery.of(context).size.width - 50,
                                    //       animation: true,
                                    //       lineHeight: 20.0,
                                    //       animationDuration: 2000,
                                    //       percent: valueToShow,
                                    //       //center: Text("90.0%"),
                                    //       linearStrokeCap: LinearStrokeCap.roundAll,
                                    //       progressColor: Colors.greenAccent,
                                    //     );
                                    //   },
                                    // ),


                                    // Flexible(
                                    //   child: Text("Goal ₹ ${_instance.postIds[index].totalDonationNeeded}",
                                    //     style: GoogleFonts.openSans(fontStyle: FontStyle.italic,color: Colors.white),),
                                    // ),
                                    Flexible(
                                      child: Text(
                                        _instance.apiData[index].homePlanet ?? "No Planet specified",
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: 10,),

                                    // GestureDetector(
                                    //   onTap: () {
                                    //     _instance.selectedRightNow = _instance.postIds[index];
                                    //     showDialog(context: context, builder: (BuildContext context){
                                    //       return SimpleDialog(
                                    //         title:const Text('Enter the Amount'),
                                    //         children: <Widget>[
                                    //           SimpleDialogOption(
                                    //               onPressed: () { },
                                    //               child:TextFormField(
                                    //                 controller: _donationAmount,
                                    //
                                    //               )
                                    //
                                    //           ),
                                    //           SimpleDialogOption(
                                    //             onPressed: () async{
                                    //               print(_donationAmount.text);
                                    //               _instance.openCheckout(int.parse(_donationAmount.text), context);
                                    //               Navigator.pop(context);
                                    //             },
                                    //             child:Container(
                                    //               child: Text("Send"),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       );
                                    //     });
                                    //   },
                                    //   child: Container(
                                    //     height: 40,
                                    //     width: 70,
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.red,
                                    //       borderRadius: BorderRadius.circular(20),
                                    //     ),
                                    //     child: Center(child: Text("Donate",style: GoogleFonts.openSans(color: Colors.white,fontSize: 15))),
                                    //   ),
                                    // ),
                                    Flexible(
                                        child: Text(
                                          "Tags : ${_instance.apiData[index].sayings?.first}",
                                          style: GoogleFonts.openSans(color: Colors.black,fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                        )),


                                  ],
                                ),
                              );

                            }
                        );
                      }

                      else {
                        return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "No Data Found",
                                style: MyTextStyle.referEarnText,
                              ),
                            ));
                      }
                      break;
                    default:
                      return Text("Some error occured");
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
