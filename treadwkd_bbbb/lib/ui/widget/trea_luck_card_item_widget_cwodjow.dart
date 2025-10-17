import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaLuckCardItemWidgetCwodjow extends TreaFaW{
  int index;
  double reward;
  TreaLuckCardItemWidgetCwodjow({
    required this.index,
    required this.reward,

  });

  @override
  State<StatefulWidget> createState() => _TreaLuckCardItemWidgetCwodjowState();
}

class _TreaLuckCardItemWidgetCwodjowState extends TreaFaWState<TreaLuckCardItemWidgetCwodjow> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  var showFront=false,showMissIcon=false;

  @override
  void initState() {
    super.initState();
    _initAnimator();
  }

  @override
  Widget wwwdwjidwo() => AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
      var angle = _animation.value * pi;
      return Transform(
        transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(angle),
        alignment: Alignment.center,
        child: Opacity(
          opacity: angle <= pi / 2 ? 1 : 0,
          child: showFront ?
          _cardFrontWidget() :
          Transform(
            transform: Matrix4.identity()..rotateY(pi),
            alignment: Alignment.center,
            child: TreaImageDhwudhiw(name: "dwimdom",width: double.infinity,height: 94.h,),
          ),
        ),
      );
    },
  );

  _cardFrontWidget(){
    if(showMissIcon){
      return Stack(
        alignment: Alignment.center,
        children: [
          TreaImageDhwudhiw(name: "dmwiw",width: double.infinity,height: 94.h,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TreaImageDhwudhiw(name: "mdniwni",width: 42.w,height: 42.w,),
              SizedBox(height: 12.h,),
              TreaGradientTextDhwiodw(
                data: "+ \$${widget.reward}",
                size: 13.sp,
                lineColor: "#D83507",
                fontWeight: FontWeight.w900,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ["#FFD70F".toColordwdowfw(),"#D9FF00".toColordwdowfw(),"#FFD500".toColordwdowfw(),],
                ),
              ),
            ],
          ),
        ],
      );
    }else{
      return Stack(
        alignment: Alignment.center,
        children: [
          TreaImageDhwudhiw(name: "cnmiwndiw",width: double.infinity,height: 94.h,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TreaImageDhwudhiw(name: "mdiwndi",height: 29.h,boxFit: BoxFit.fitHeight,),
              SizedBox(height: 12.h,),
              TreaGradientTextDhwiodw(
                data: "+ \$${widget.reward}",
                size: 13.sp,
                lineColor: "#D83507",
                fontWeight: FontWeight.w900,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ["#FFD70F".toColordwdowfw(),"#D9FF00".toColordwdowfw(),"#FFD500".toColordwdowfw(),],
                ),
              ),
            ],
          )
        ],
      );
    }
  }

  _initAnimator(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showFront=!showFront;
        });
        _controller.reverse();
      }
    });
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.flipLuckyCard:
        _flipLuckyCard(bean.i);
        break;
      case TreaEventCodeDhwdhwi.flipOtherLuckyCard:
        _flipOtherLuckyCard(bean.i);
        break;
    }
  }

  _flipOtherLuckyCard(int? i){
    if(i==widget.index){
      return;
    }
    setState(() {
      showMissIcon=true;
    });
    _controller.forward();
  }

  _flipLuckyCard(int? i){
    if(i!=widget.index){
      return;
    }
    _controller.forward();
  }
}