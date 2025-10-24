import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_finger_widget_djiwji.dart';

class TreaAutoGuaAnimatorDjwidjomw extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TreaAutoGuaAnimatorDjwidjomwState();
}

class _TreaAutoGuaAnimatorDjwidjomwState extends State<TreaAutoGuaAnimatorDjwidjomw> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  double stepDown = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(top: 200.h),
    child: LayoutBuilder(
      builder: (context,bc){
        var width = bc.maxWidth-110.w;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: _getOffset(width),
              child: child!,
            );
          },
          child: TreaFingerWidgetDjiwji(),
        );
      },
    ),
  );

  Offset _getOffset(double width){
    final t = _controller.value;
    double x, y;
    if (t < 0.25) {
      // 第一段: 往右 (水平直线)
      final progress = t / 0.25;
      x = progress * width;
      y = 0;
    } else if (t < 0.5) {
      // 第二段: 往左 + 往下
      final progress = (t - 0.25) / 0.25;
      x = (1 - progress) * width;
      y = progress * stepDown;
    } else if (t < 0.75) {
      // 第三段: 往右 + 往下
      final progress = (t - 0.5) / 0.25;
      x = progress * width;
      y = stepDown + progress * stepDown;
    } else {
      // 第四段: 往左 + 往下
      final progress = (t - 0.75) / 0.25;
      x = (1 - progress) * width;
      y = stepDown * 2 + progress * stepDown;
    }
    return Offset(x, y);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}