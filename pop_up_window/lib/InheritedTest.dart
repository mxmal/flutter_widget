import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedData extends InheritedWidget {
  final String data;
  final Color color;

  InheritedData({
    this.color,
    this.data,
    Widget child,
  }) : super(child: child);

  static InheritedData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedData>();
  }

  @override
  bool updateShouldNotify(InheritedData old) => true;
}

class TestInheritedDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: InheritedData.of(context).color,
      child: Text(
        "${InheritedData.of(context).data}",
        style: TextStyle(fontSize: 18, color: Colors.pink),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  var data = "you are beautiful";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: Colors.cyan,
          width: double.infinity,
          child: InheritedData(
            data: data,
            color: Colors.red,
            child: TestInheritedDataWidget(),
          ),
        ),
        onTap: _buttonClicked,
      ),
    );
  }

  _buttonClicked() {
    setState(() {
      data = (data == "in white") ? "I am handsome" : "in white";
    });
  }
}
