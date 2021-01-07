import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
//   PictureRecorder pr = PictureRecorder();
//
//   Canvas canvas = Canvas(pr);
//   Paint circlePaint = Paint();
//   circlePaint.color = Colors.blue;
//   Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 0.0);
//   RRect rectMy = RRect.fromRectAndRadius(rect, Radius.circular(0.0));
//   canvas.drawRRect(rectMy, circlePaint);
//   Picture picture = pr.endRecording();
//
//   SceneBuilder sceneBuilder = SceneBuilder();
//   sceneBuilder.pushOffset(0, 0);
//   sceneBuilder.addPicture(Offset(0, 0), picture);
//   sceneBuilder.pop();
//   Scene scene = sceneBuilder.build();
//   window.onDrawFrame = () {
//     window.render(scene);
//   };
//   window.scheduleFrame();
// }
}

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('贝塞尔曲线切割')),
      body: Column(
        children: <Widget>[
          ClipPath(
            //路径裁切组件
            clipper: BottomClipper(), //路径
            child: Container(
              color: Colors.deepOrangeAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - 50.0); //第2个点
    // var firstControlPoint = Offset(size.width / 2, size.height);
    // var firstEdnPoint = Offset(size.width, size.height - 50.0);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstEdnPoint.dx, firstEdnPoint.dy);
    path.lineTo(size.width / 2 - 10, size.height - 50.0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 10, size.height - 50.0);
    path.lineTo(size.width, size.height - 50.0); //第3个点
    path.lineTo(size.width, 0); //第4个点

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
