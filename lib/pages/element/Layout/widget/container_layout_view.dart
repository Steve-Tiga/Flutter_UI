import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class ContainerLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        height: 200,
        child: Column(
          children: [
            ElementTitleView("定位装饰-Container"),
            Container(
              color: Colors.blue,
              //设置内边距( padding )
              padding: EdgeInsets.all(25),
              child: Container(
                //设置外边距( margin )
                margin: EdgeInsets.only(top: 10),
                //设置固定属性的宽高
                width: 180,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //设置圆角
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.red,
                  //设置边框效果
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  ),
                ),
                child: Text('Flutter'),
                alignment: Alignment.center,
              ),
              //通过transform可以旋转、平移、缩放Container
              transform: Matrix4.rotationZ(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
