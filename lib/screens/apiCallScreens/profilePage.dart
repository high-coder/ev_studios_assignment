import 'package:cached_network_image/cached_network_image.dart';
import 'package:ev_studios_assignment/models/apiDataModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/our_colours.dart';

class ProfilePage extends StatefulWidget {
  ApiDataModel userData;

  ProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon:const Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        height: 130,
                        //width: 130,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CachedNetworkImage(imageUrl: widget.userData.images?.main ?? "",fit: BoxFit.scaleDown,),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          children: [
                            Text("${widget.userData.nameData?.firstName} ${widget.userData.nameData?.middle} ${widget.userData.nameData?.lastName} ",style: GoogleFonts.aBeeZee(fontSize: 20),),
                            SizedBox(height: 4,),
                            Text("${widget.userData.age}, ${widget.userData.gender}",style: GoogleFonts.acme(),),
                            SizedBox(height: 4,),

                            Text(
                            widget.userData.occupation ?? "No occupation specified",
                              style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  color: MyColors.appThemeBlueText,
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 4,),


                            Text(
                              widget.userData.homePlanet ?? "No Planet specified",
                              maxLines: 2,
                              style: GoogleFonts.aladin(fontSize: 14,color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 15,),
                // sayings will be displayed over here
                ...List.generate(widget.userData.sayings?.length ?? 0, (index) {
                  return Text(widget.userData.sayings?[index] ?? "",style: GoogleFonts.poppins(fontSize: 14),);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
