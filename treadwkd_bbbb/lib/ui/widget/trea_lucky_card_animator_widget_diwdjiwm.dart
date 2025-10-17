import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaLuckyCardAnimatorWidgetDiwdjiwm extends TreaFaW{
  @override
  State<StatefulWidget> createState() => _TreaLuckyCardAnimatorWidgetDiwdjiwm();
}

class _TreaLuckyCardAnimatorWidgetDiwdjiwm extends TreaFaWState<TreaLuckyCardAnimatorWidgetDiwdjiwm> with SingleTickerProviderStateMixin{
  Offset? startOffset;
  Offset? endOffset;
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget wwwdwjidwo() {
    if(null==startOffset||null==endOffset){
      return Container();
    }
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Positioned(
              left: _positionAnimation.value.dx,
              top: _positionAnimation.value.dy,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: TreaImageDhwudhiw(name: "dowdowm",width: 73.w,height: 73.w,),
              ),
            );
          },
        ),
      ],
    );
  }

  _init(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.showLuckyCardAnimator:
        _showLuckyCardAnimator(bean.map);
        break;
    }
  }

  _showLuckyCardAnimator(Map? map)async{
    startOffset = map?["startOffset"];
    final screenSize = MediaQuery.of(context).size;
    endOffset=Offset(screenSize.width / 2, screenSize.height / 2,);
    if(null==startOffset||null==endOffset){
      return;
    }
    setState(() {});
    _positionAnimation = Tween<Offset>(
      begin: startOffset,
      end: endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    await _controller.forward();
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