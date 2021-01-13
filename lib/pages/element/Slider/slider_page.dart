import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 0;
  double _iosSliderValue = 0;
  double _adaptiveSliderValue = 0;

  RangeValues _rangeValues = RangeValues(0, 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑块'),
      ),
      body: Container(
        child: Column(
          children: [
            ElementTitleView('自定义滑块'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),//设置提示的样式
              ),
              child: Slider(
                value: _sliderValue,
                label: '$_sliderValue',
                min: 0,
                max: 100,
//                divisions: 4, //设置离散
                onChanged: (v) {
                  setState(() {
                    _sliderValue = v;
                  });
                },
              ),
            ),
            ElementTitleView('带范围的滑块'),
            RangeSlider(
              values: _rangeValues,
              labels: RangeLabels('${_rangeValues.start}','${_rangeValues.end}'),
              min: 0,
              max: 100,
              onChanged: (v) {
                setState(() {
                  _rangeValues = v;
                });
              },
            ),
            ElementTitleView('ios风格的滑块'),
            CupertinoSlider(
              value: _iosSliderValue,
              onChanged: (v) {
                setState(() {
                  _iosSliderValue = v;
                });
              },
            ),
            ElementTitleView('根据平台显示风格'),
            Slider.adaptive(
              value: _adaptiveSliderValue,
              onChanged: (v) {
                setState(() {
                  _adaptiveSliderValue = v;
                });
              },
            )

          ],
        ),
      ),
    );
  }
}
