import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime time = DateTime.now();
  bool fordigital = true;
  bool foranalog = false;
  bool forstrap = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              "Welcome To Clock World..!!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Stack(alignment: AlignmentDirectional.center,
            children: [
              //Digital watch
              Visibility(
                visible: fordigital,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Colors.green.shade100, Colors.yellow.shade200]),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    // alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         // SizedBox(height: 20),
                        Text(
                          "   ${time.hour}:${time.minute}:${time.second}\n"
                          "  ${time.month}'${time.day}' ${time.year}",
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.green.shade800,
                          ),
                        ),
                        SizedBox(height:5),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       height:30,
                        //       width: 25,
                        //       color: Colors.black,
                        //     ),
                        //   ],
                        // ),
                        Text("❤️ Beats 71  ⛅️️ 28 C\n"
                            "👣 Steps 40  ⭐ quality\n"
                            "               🪫87%"
                        ),
                      ],
                    ),
                  ),
                    Transform.scale(
                      alignment: Alignment.center,
                      scale: 6,
                      origin:Offset(0.5,23),
                      child: CircularProgressIndicator(
                          value:time.second/60,
                          strokeCap: StrokeCap.round,
                          color: Colors.green.shade200),
                    )
                  ],
                ),
              ),
              
              //Analog watch
              // Visibility(
              //   visible: foranalog,
              //   child: Stack(
              //     children: List.generate(60, (index) =>
              //         Transform.rotate(angle: (pi*2*index)/60,
              //         child: Divider(
              //           color: index%5==0?Colors.red:Colors.black,
              //           endIndent:index%5==0?MediaQuery.sizeOf(context).width*0.9:MediaQuery.sizeOf(context).width*0.95,
              //           // color: Colors.black,
              //           thickness: 5,
              //         ),
              //         ),
              //     ),
              //   ),
              // ),
              Visibility(
                visible: foranalog,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset("assets/image/clock.png"),
                    Image.asset("assets/image/flower.png",
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),//image
              Visibility(
                visible: foranalog,
                child: Transform.rotate(
                    angle: ((pi*2)*time.second)/60,
                    child: Transform.rotate(
                    angle: pi/2,
                    child: Divider(
                      color: Colors.indigo,
                      thickness: 2,
                      indent: 60,
                      endIndent: MediaQuery.sizeOf(context).width*0.5,
                    ),
                  ),
                ),
              ),//second
              Visibility(
                visible: foranalog,
                child: Transform.rotate(
                    angle: (pi*2*time.minute)/60,
                    child: Transform.rotate(
                    angle: pi/2,
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                      indent: 90,
                      endIndent: MediaQuery.sizeOf(context).width*0.50,
                    ),
                  ),
                ),
              ),//minute
              Visibility(
                visible: foranalog,
                child: Transform.rotate(
                    angle: (pi*2*time.hour)/12,
                    child: Transform.rotate(
                    angle: pi/2,
                    child: Divider(
                      color: Colors.red,
                      thickness: 5,
                      indent: 110,
                      endIndent: MediaQuery.sizeOf(context).width*0.50,
                    ),
                  ),
                ),
              ),//hour
              //FlutterLogo(),


              //Strap watch
              Visibility(
                visible: forstrap,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset("assets/image/3.png",
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      child: CircularProgressIndicator(
                      value: time.second*1/60,
                        color: Colors.blue.shade200,
                        backgroundColor: Colors.blue.shade100.withOpacity(0.2),
                        strokeCap: StrokeCap.round,
                        strokeWidth:20,
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      child: CircularProgressIndicator(
                      value: time.minute/60,
                        color: Colors.purple.shade200,
                        backgroundColor: Colors.purple.shade200.withOpacity(0.2),
                        strokeCap: StrokeCap.round,
                        strokeWidth:20,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                      value: time.hour/12,
                        color: Colors.teal.shade200,
                        backgroundColor: Colors.teal.shade200.withOpacity(0.2),
                        strokeCap: StrokeCap.round,
                        strokeWidth:20,
                      ),
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40,),
                        Text(" ${time.hour}:${time.minute}:${time.second}\n"
                        " ${time.day}/${time.month}/${time.year}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 0.05,),
                        Image.asset("assets/image/apple.png",
                          height:100,
                          width: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [Icon(Icons.watch_later_rounded,
              size: 30,),
              SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Digital Clock",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        fordigital = true;
                        foranalog = false;
                        forstrap = false;
                      });
                      Navigator.pop(context);
                    },
                        child:Text("Press")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Analog Clock",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        fordigital = false;
                        foranalog = true;
                        forstrap = false;
                      });
                      Navigator.pop(context);
                    },
                        child:Text("Press")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Strap Clock",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        fordigital = false;
                        foranalog = false;
                        forstrap = true;
                      });
                      Navigator.pop(context);
                    },
                        child:Text("Press")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO:implement initState
    super.initState();
    getData();
  }
  void getData()
  {
    setState(() {
      time = DateTime.now();
    });
    Future.delayed(Duration(seconds: 1),()
    {
      getData();
    });
  }
}