import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class IndexedStackDemo extends StatefulWidget {
  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ElementTitleView('叠加布局-IndexedStack'),
            SizedBox(
              height: 20,
            ),
            _buildIndexedStack(),
            SizedBox(
              height: 30,
            ),
            _buildRow(),
          ],
        ),
      ),
    );
  }

  _buildIndexedStack() {
    return IndexedStack(
      index: _index,
      children: <Widget>[
        Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(
              Icons.fastfood,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
            alignment: Alignment.center,
            child: Icon(
              Icons.cake,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Icon(
              Icons.local_cafe,
              size: 60,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.fastfood),
          onPressed: () {
            setState(() {
              _index = 0;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.cake),
          onPressed: () {
            setState(() {
              _index = 1;
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.local_cafe),
          onPressed: () {
            setState(() {
              _index = 2;
            });
          },
        ),
      ],
    );
  }
}
