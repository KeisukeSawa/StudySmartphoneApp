import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Challenge!スマホアプリ勉強会'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://static.wixstatic.com/media/f07406_12efec0cbbd24061928f726725d28cb1~mv2_d_3000_1900_s_2.jpg/v1/crop/x_0,y_14,w_3000,h_1872/fill/w_638,h_362,al_c,q_80,usm_0.66_1.00_0.01/f07406_12efec0cbbd24061928f726725d28cb1~mv2_d_3000_1900_s_2.webp',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          Container(
              padding: const EdgeInsets.all(32),
              child: Row(    // 1行目
                children: <Widget>[
                  Expanded(  // 2.1列目
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(  // 3.1.1行目
                          margin: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            "コワーキングスペースカラム",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Container(  // 3.1.2行目
                          child: Text(
                            "山口県周南市若宮町1-21 3F ",
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(  // 2.2列目
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text('41'),  // 2.3列目
                ],
              )
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonColumn( Icons.call, 'CALL'),
                  _buildButtonColumn( Icons.near_me, 'ROUTE'),
                  _buildButtonColumn( Icons.share, 'SHARE'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Text(
                '山口県周南市コワーキングスペース「カラム」'
                '人が繋がるシェアスペース'
                '用途は様々：2時間500円から使えるシェアスペース'
                'パソコン作業、自習、講習会、打ち合わせ、A1大判プリント ',
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color color = const Color.fromARGB(255, 66, 165, 245);

  Column _buildButtonColumn( IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
