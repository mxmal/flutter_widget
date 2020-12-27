import 'package:flutter/material.dart';
import 'package:pop_up_window/pop_route.dart';
import 'package:pop_up_window/pop_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String offsetText = "";
  GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
          onPanStart: (detail) {
            print(
                "${detail.runtimeType}, ${detail.localPosition}, ${detail.globalPosition}");
          },
          onPanUpdate: (detail) {
            print(
                "${detail.runtimeType},${detail.localPosition},${detail.globalPosition}");
            setState(() {
              offsetText =
                  "globalPosition: ${Offset(detail.globalPosition.dx, detail.globalPosition.dy).toString()} \n"
                  "localPosition: ${Offset(detail.localPosition.dx, detail.localPosition.dy).toString()}";
            });
          },
          onPanEnd: (detail) {
            setState(() {
              offsetText = "end";
            });
          },
          child: Container(
            color: Colors.red,
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                offsetText,
                key: _key,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getPosition() {
    RenderBox box = _key.currentContext.findRenderObject();
    Offset offset = box.localToGlobal(Offset.zero);
    print(offset);
//获取size
    Size size = box.size;
    print(size);
  }
}
