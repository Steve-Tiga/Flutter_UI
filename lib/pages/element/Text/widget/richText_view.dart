import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';
import 'package:flutterstudy/res/colors.dart';
import 'package:oktoast/oktoast.dart';

class RichTextPage extends StatefulWidget {
  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ElementTitleView('富文本'),
            Container(
              padding: const EdgeInsets.all(12),
              child: RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <InlineSpan>[
                      TextSpan(
                          text: '非优秀的程序员常常把空间和时间消耗殆尽',
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      TextSpan(text: '，'),
                      TextSpan(text: '优秀的程序员则总是有足够的空间和时间去完成编程...'),
                    ]),
              ),
            ),
            SizedBox(
              child: Container(
                color: HSLColors.bg_color,
              ),
              height: 12,
            ),
            ElementTitleView('过渡颜色的文字'),
            Container(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'LinearGradient设置渐变色',
                  style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..shader =
                            LinearGradient(colors: [Colors.purple, Colors.blue])
                                .createShader(Rect.fromLTWH(0, 0, 300, 0))),
                )),
            SizedBox(
              child: Container(
                color: HSLColors.bg_color,
              ),
              height: 12,
            ),
            ElementTitleView('带前后置标签的文本'),
            Container(
                padding: const EdgeInsets.all(16),
                child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <InlineSpan>[
                        WidgetSpan(
                            child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue),
                          child: Text(
                            '判断题',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                        TextSpan(text: '泡沫灭火器可用于带电灭火'),
                      ]),
                )),
            SizedBox(
              child: Container(
                color: HSLColors.bg_color,
              ),
              height: 12,
            ),
            ElementTitleView('服务协议'),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text.rich(
                TextSpan(
                    text: '登录即代表同意并阅读',
                    style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                    children: [
                      TextSpan(
                        text: '《服务协议》',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showToast('点击了服务协议');
                          },
                      ),
                    ]),
              ),
            ),
            SizedBox(
              child: Container(
                color: HSLColors.bg_color,
              ),
              height: 12,
            ),
            ElementTitleView('登录密码输入框'),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0x30cccccc),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00FF0000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: '输入密码',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              child: Container(
                color: HSLColors.bg_color,
              ),
              height: 12,
            ),
            ElementTitleView('评论回复'),
            Container(
                padding: const EdgeInsets.all(12),
                child: Text.rich(
                  TextSpan(
                      text: '回复',
                      style: TextStyle(fontSize: 16, color: Color(0xFF999999)),
                      children: [
                        TextSpan(
                          text: '@谷歌：',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('onTap');
                            },
                        ),
                        TextSpan(
                          text: '来点牛逼的',
                        ),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
