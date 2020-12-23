import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Popup extends StatefulWidget {
  final Widget child;
  final Function onClick; //点击child事件
  final double left; //距离左边位置
  final double top; //距离上面位置

  Popup({
    @required this.child,
    this.onClick,
    this.left,
    this.top,
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PopupState();
  }
}

class PopupState extends State<Popup> {
  List group = [];
  List data = [
    "A:阿法发顺丰喝咖啡是不可",
    "B:达到顾客哈市覅按司法所",
    "C:哦啊都很高发已法院撒搜房门牌卡什么发票",
    "D:案件时空裂缝过海富奥斯发表羧甲淀粉钠看见爱上你佛Ian"
  ];
  int n = 5;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < data.length; i++) {
      group.add(1);
    }
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Container(
          width: 400,
          height: 400,
          child: Column(
            children: data.asMap().keys.map((e) => _buildExit(e)).toList(),
          ),
        ),
        onTap: () {
          //点击空白处
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _buildExit(int e) {
    if (e == n) {
      group[e] = 0;
    } else {
      group[e] = 1;
    }
    return GestureDetector(
      onTap: () {
        if (n == e) {
          print(n);
          n = 5;
        } else {
          n = e;
          print(n);
        }
        setState(() {});
      },
      child: Container(
          color: Colors.red,
          child: Container(
            child: Row(
              children: [
                Radio(
                    value: 0,
                    groupValue: group[e],
                    onChanged: (a) {
                      print(a);
                      if (n == e) {
                        n = 5;
                      } else {
                        n = e;
                        print(group[e]);
                      }

                      setState(() {});
                    }),
                Expanded(child: Text(data[e]))
              ],
            ),
          )),
    );
  }
}
