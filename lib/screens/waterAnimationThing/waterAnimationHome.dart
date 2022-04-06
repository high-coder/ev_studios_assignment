import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
class WaterThing extends StatefulWidget {
  const WaterThing({Key? key}) : super(key: key);

  @override
  State<WaterThing> createState() => _WaterThingState();
}

class _WaterThingState extends State<WaterThing> {


  SMIInput<bool> ?_waterInput;
  Artboard? _waterArtBoard;


  void _stopOrPlayWater() {
    print("inside here");
    if(_waterInput?.value ==false) {
      _waterInput?.value = true;
    } else if(_waterInput?.value == true) {
      _waterInput?.value = false;
    }
    // if(_waterInput?.value == false && _waterInput?.controller.isActive == false) {
    //   _waterInput?.value = true;
    // } else if(_waterInput?.value == true && _waterInput?.controller.isActive == false) {
    //   _waterInput?.value = false;
    // }
    //_waterInput?.value = false;
    print(_waterInput?.value);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('assets/waterAnimationThing.riv').then((data) {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;
      var controller = StateMachineController.fromArtboard(artBoard, 'waterEngine');

      if(controller!=null) {
        // do something here matey
        artBoard.addController(controller);
        _waterInput = controller.findInput('isStart');
        _waterInput?.value = false;

      }
      setState(() {
        _waterArtBoard = artBoard;
      });
    });
  }  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GestureDetector(
            onTap:()=> _stopOrPlayWater(),
            child: SizedBox(

              height: size.height,
              width: size.width,
              child: Rive(artboard: _waterArtBoard!,fit: BoxFit.fitHeight,),
            ),
          ),
        ),
      ),
    );
  }
}
