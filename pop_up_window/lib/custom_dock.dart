import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    print(1);
    return super.createElement();
  }

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomDock(),
    );
  }
}

class CustomDock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: MyPainter(),
    );
  }
}
//
// class MyPainter extends CustomPainter{
//
//   Paint _myPaint;
//   @override
//   void paint(Canvas canvas, Size size) {
//     _myPaint = new Paint();
//     _myPaint.color =Colors.blue;
//
//     //canvas.drawPaint(_myPaint);
//     // canvas.drawCircle(Offset(100,100), 100, _myPaint);
//     // canvas.drawLine(Offset(300,300),Offset(400,400) , _myPaint);
//     Rect rect=
//     canvas.drawRect(, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return null;
//   }
// }

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth=1.0
      ..style=PaintingStyle.fill
      ..color=Colors.blue
      ..invertColors=false;
    double cx=size.width/2,cy=size.height/2;
    double radius=size.width/4;
    Rect rect=Rect.fromCircle(center: Offset(cx,cy),radius: radius);
    canvas.drawRect(rect, paint);

    var path = Path();
    path.moveTo(size.width / 3, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height * 5 / 6);
    path.lineTo(size.width * 3 / 4, size.height * 4 / 6);
    canvas.drawPath(path, paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}