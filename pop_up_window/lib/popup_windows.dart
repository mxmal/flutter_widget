import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_windows/popup_windows.dart';

//pop_up_window测试
//结果：可以显示在控件下面，也可以从底部或顶部及两边弹出来
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PopupWindos Demo',
      home: MyHomePage(title: 'PopupWindows'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.topLeft,
        child: PopupWindowWidget(
          //offset: Offset(40.0, 0.0),
          intelligentConversion: true,
          direction: Direction.Bottom,
          child: Container(
            color: Colors.pinkAccent,
            padding: EdgeInsets.all(20.0),
            //margin: EdgeInsets.only(left: 40.0),
            child: Text(
              'left',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
          showChild: Container(
            height: 200.0,
            alignment: Alignment.bottomCenter,
            color: Color(0X33000000),
            child: Container(
              height: 100.0,
              color: Colors.blueAccent,
            ),
          ),
        ),
      )),
    );
  }
}
