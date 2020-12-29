import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyTest());
}

class MyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWidgetState();
  }
}

//改变数组里元素的位置，对于Statlesswidget里可以刷新视图，但对与Statefulwidget一定要传一个可以变widget得值,这样Element树对比到不一样才会刷新，如UniqueKey
//key相当于身份证，GlobaKey可以改变元素在元素树里的位置，但开销很大,也可以得到元素及其拥有的属性
class MyWidgetState extends State<MyWidget> {
  final List<Widget> _statelessTiles = [
    StatelessColorBlock(UniqueKey()),
    StatelessColorBlock1(UniqueKey()),
  ];

  _swapTiles() {
    setState(() {
      _statelessTiles.insert(1, _statelessTiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Row(
        children: _statelessTiles,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapTiles,
        child: Icon(Icons.swap_horizontal_circle),
      ),
    );
  }
}

class StatelessColorBlock extends StatefulWidget {
  StatelessColorBlock(UniqueKey uniqueKey);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatelessColorBlockState();
  }
}

class StatelessColorBlockState extends State<StatelessColorBlock> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width: 100, height: 200, color: Colors.black);
  }
}

class StatelessColorBlock1 extends StatefulWidget {
  StatelessColorBlock1(UniqueKey uniqueKey);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatelessColorBlock1State();
  }
}

class StatelessColorBlock1State extends State<StatelessColorBlock1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width: 100, height: 200, color: Colors.red);
  }
}
