import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaKeyAnimatorWidgetDmwidow extends TreaFaW{
  @override
  State<StatefulWidget> createState() => _TreaKeyAnimatorWidgetDmwidowState();
}

class _TreaKeyAnimatorWidgetDmwidowState extends TreaFaWState<TreaKeyAnimatorWidgetDmwidow> with SingleTickerProviderStateMixin{
  Offset? startOffset;
  Offset? endOffset;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _initAnimator();
  }

  @override
  Widget wwwdwjidwo() {
    if(null==startOffset||null==endOffset){
      return Container();
    }
    return  AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: child,
        );
      },
      child: TreaImageDhwudhiw(name: "icon_key",width: 40.w,height: 40.h,),
    );
  }

  _initAnimator(){
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.showKeyAnimator:
        _showKeyAnimator(bean.map);
        break;
    }
  }

  _showKeyAnimator(Map? map)async{
    startOffset = map?["startOffset"];
    endOffset = map?["endOffset"];
    if(null==startOffset||null==endOffset){
      return;
    }
    _animation = Tween<Offset>(begin: startOffset, end: endOffset).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    setState(() {});
    _controller..reset()..forward();
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      startOffset=null;
      endOffset=null;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}