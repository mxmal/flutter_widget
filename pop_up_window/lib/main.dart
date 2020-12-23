//
// import 'package:flutter/material.dart';
// import 'package:pop_up_window/pop_route.dart';
// import 'package:pop_up_window/pop_up.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   StatelessElement createElement() {
//     // TODO: implement createElement
//     print(1);
//     return super.createElement();
//   }
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//   @override
//   StatefulElement createElement() {
//     // TODO: implement createElement
//     return super.createElement();
//   }
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   int group = 0;
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//           // Here we take the value from the MyHomePage object that was created by
//           // the App.build method, and use it to set our appbar title.
//           title: Text(widget.title),
//         ),
//         body: GestureDetector(
//           child: _buildUserIcon(),
//         )
//         // This trailing comma makes auto-formatting nicer for build methods.
//         );
//   }
//
//   ///构建用户头像按钮
//   ///点击头像弹出退出按钮
//   Widget _buildUserIcon() {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(20, 22, 0, 0),
//       child: GestureDetector(
//         child: Container(
//             child: Image.asset(
//               "images/login_eye.png",
//             ),
//             width: 32,
//             height: 32,
//             alignment: AlignmentDirectional.bottomStart),
//         onTap: _showExit,
//       ),
//     );
//   }
//
//   ///构建退出按钮
//
//   ///弹出退出按钮
//   ///点击退出调用onClick
//   void _showExit() {
//     Navigator.push(
//       context,
//       PopRoute(
//         child: Popup(
//           // child: _buildExit(),
//           left: 64,
//           top: 22,
//           // onClick: () {},
//         ),
//       ),
//     );
//   }
//
//   @override
//   void didUpdateWidget(covariant MyHomePage oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }
// }
