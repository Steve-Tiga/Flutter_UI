import 'dart:math';

import 'package:flutter/material.dart' hide Image;

class WaveWidget extends StatefulWidget {
///控件大小
  Size size;

  ///振幅
  double waveAmplitude;

///角度偏移
  double wavePhase;

///频率
  double waveFrequency;

///x轴位置百分比
  double heightPercentange;

  Color bgColor;

  WaveWidget(
      {@required this.size,
        this.waveAmplitude = 10.0,
        this.waveFrequency = 1.6,
        this.wavePhase = 10.0,
        this.bgColor,
        this.heightPercentange = 6 / 7});

  @override
  State<StatefulWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  AnimationController _waveControl;
  Animation<double> _wavePhaseValue;

  @override
  void initState() {
    super.initState();
    _waveControl =
    new AnimationController(vsync: this, duration: Duration(seconds: 2));
    _wavePhaseValue =
        Tween(begin: widget.wavePhase, end: 360 + widget.wavePhase)
            .animate(_waveControl);
    _wavePhaseValue.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        _waveControl.reset();
        _waveControl.forward();
      }
    });
    _waveControl.forward();
  }
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MyWavePaint(
          bgColor: widget.bgColor,
          heightPercentange: widget.heightPercentange,
          repaint: _waveControl,
          waveFrequency: widget.waveFrequency,
          wavePhaseValue: _wavePhaseValue,
          waveAmplitude: widget.waveAmplitude),
      size: widget.size,
    );
  }

  @override
  void dispose() {
    _waveControl.dispose();
    super.dispose();
  }
}

class _MyWavePaint extends CustomPainter {
  _MyWavePaint(
      {this.imgOffset,
        this.bgColor,
        this.heightPercentange,
        this.waveFrequency,
        this.wavePhaseValue,
        this.waveAmplitude,
        Listenable repaint})
      : super(repaint: repaint);

///振幅
  double waveAmplitude;

///角度
  Animation<double> wavePhaseValue;

///频率
  double waveFrequency;

///x轴位置百分比
  double heightPercentange;

///图标偏移
  Offset imgOffset;
  Color bgColor;
  Path path1 = Path();
  Path path2 = Path();
  Path path3 = Path();
  double _tempa = 0.0;
  double _tempb = 0.0;
  double viewWidth = 0.0;
  Paint mPaint = Paint();
  Rect rect;

  @override
  void paint(Canvas canvas, Size size) {
    var viewCenterY = size.height * heightPercentange;
    viewWidth = size.width;
    if (bgColor != null) {
      mPaint.color = bgColor;
      if (rect == null) {
        rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
      }
      canvas.drawRect(rect, mPaint);
    }
    _fillPath(viewCenterY, size);

    mPaint.color = Color(0xc0ffffff);
    canvas.drawPath(path1, mPaint);

    mPaint.color = Color(0xB0ffffff);
    canvas.drawPath(path2, mPaint);
    mPaint.color = Color(0x80ffffff);
    canvas.drawPath(path3, mPaint);
  }

  void _fillPath(double viewCenterY, Size size) {
    path1.reset();
    path2.reset();
    path3.reset();
    path1.moveTo(
        0.0,
        viewCenterY -
            waveAmplitude * _getSinY(wavePhaseValue.value, waveFrequency, -1));
    path2.moveTo(
        0.0,
        viewCenterY -
            1.3 *
                waveAmplitude *
                _getSinY(wavePhaseValue.value + 90, waveFrequency, -1));
    path3.moveTo(
        0.0,
        viewCenterY +
            waveAmplitude * _getSinY(wavePhaseValue.value, waveFrequency, -1));

    for (int i = 0; i < size.width - 1; i++) {
      path1.lineTo(
          (i + 1).toDouble(),
          viewCenterY -
              waveAmplitude *
                  _getSinY(wavePhaseValue.value, waveFrequency, (i + 1)));
      path2.lineTo(
          (i + 1).toDouble(),
          viewCenterY -
              1.3 *
                  waveAmplitude *
                  _getSinY(
                      wavePhaseValue.value + 90, 0.8 * waveFrequency, (i + 1)));
      path3.lineTo(
          (i + 1).toDouble(),
          viewCenterY +
              waveAmplitude *
                  _getSinY(wavePhaseValue.value, waveFrequency, -1));
    }
    path1.lineTo(size.width, size.height);
    path2.lineTo(size.width, size.height);
    path3.lineTo(size.width, size.height);

    path1.lineTo(0.0, size.height);
    path2.lineTo(0.0, size.height);
    path3.lineTo(0.0, size.height);

    path1.close();
    path2.close();
    path3.close();
  }

  @override
  bool shouldRepaint(_MyWavePaint oldDelegate) {
    return false;
  }

  double _getSinY(
      double startradius, double waveFrequency, int currentposition) {
    //避免重复计算，提取公用值
    if (_tempa == 0) _tempa = pi / viewWidth;
    if (_tempb == 0) {
      _tempb = 2 * pi / 360.0;
    }
    return (sin(
        _tempa * waveFrequency * (currentposition + 1) + startradius * _tempb));
  }
}
