import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Timer App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  TabController tb;
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = true;
  int timeForTimer = 0;
  String timetodisplay = "";
  bool checkTimer = true;

  void start(){
    setState(() {
      started = false;
      stopped = false;
    });
    timeForTimer = (hour * 60 * 60) + (min * 60) + (sec);
    // debugPrint(timeForTimer.toString());
    Timer.periodic(Duration(
      seconds: 1,
    ), (Timer t){
      setState(() {
        if(timeForTimer < 1 || checkTimer == false){
          t.cancel();
          checkTimer = true;
          timetodisplay = "";
          started  =true;
          stopped = true;
          /*
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
          */
        }
        else{
          timeForTimer = timeForTimer - 1;
        }
        timetodisplay = timeForTimer.toString();
      });
    });
  }

  void stop(){
    setState(() {
      started = true;
      stopped = true;
      checkTimer = false;
    });
  }

  @override
  void initState(){
    tb= TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  Widget timer(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                          "時",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: hour,
                      minValue: 0,
                      maxValue: 23,
                      listViewWidth: 60.0,
                      onChanged: (val){
                        setState(() {
                          hour = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                          "分",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: min,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (val){
                        setState(() {
                          min = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                          "秒",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    NumberPicker.integer(
                      initialValue: sec,
                      minValue: 0,
                      maxValue: 59,
                      listViewWidth: 60.0,
                      onChanged: (val){
                        setState(() {
                          sec = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Text(
              timetodisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                 color:  Colors.green,
                  onPressed: started ? start: null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                RaisedButton(
                  color:  Colors.red,
                  onPressed: stopped ? null: stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom:TabBar(
          tabs: <Widget>[
            Text(
              "Timer"
            ),
            Text(
              "StopWatch"
            ),
          ],
          labelPadding: EdgeInsets.only(
            bottom: 10.0,
          ),
          labelStyle: TextStyle(
            fontSize: 18.0,
          ),
          unselectedLabelColor: Colors.white60,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          Text(
            "StopWatch"
          ),
        ],
        controller: tb,
      ),
    );
  }
}
