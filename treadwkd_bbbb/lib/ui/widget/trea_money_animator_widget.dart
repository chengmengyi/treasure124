import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_spine_dwjoidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaMoneyAnimatorWidget extends TreaFaW{
  @override
  State<StatefulWidget> createState() => _TreaMoneyAnimatorWidgetState();
}

class _TreaMoneyAnimatorWidgetState extends TreaFaWState<TreaMoneyAnimatorWidget>{
  var showAnimator=false;
  late SpineWidgetController spineWidgetController;

  @override
  void initState() {
    super.initState();
    spineWidgetController=SpineWidgetController(
      onInitialized: (controller) {

      },
    );
  }
  
  @override
  Widget wwwdwjidwo()=>Offstage(
    offstage: !showAnimator,
    child: Container(
      margin: EdgeInsets.only(top: 80.h),
      child: TreaSpineDwjoidjow(
        atlasFile: "money",
        skeletonFile: "skeleton",
        animatorName: "animation",
        folder: "money",
        width: 200.w,
        height: 100.h,
        controller: spineWidgetController,
      ),
    ),
  );

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.showMoneyAnimator:
        _showMoneyAnimator();
        break;
    }
  }

  _showMoneyAnimator()async{
    setState(() {
      showAnimator=true;
    });
    spineWidgetController.animationState.setAnimationByName(0, "animation", false);
    await Future.delayed(Duration(milliseconds: 1000));
    if (!mounted){
      return;
    }
    setState(() {
      showAnimator=false;
    });
  }
}