import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/bean/trea_level_bean_jwijfo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_level_hep_dwifnowe.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaTopWidgetDjheidow extends TreaFaW{
  bool fromHome;
  TreaTopWidgetDjheidow({
    this.fromHome=false,
});
  @override
  State<StatefulWidget> createState() => _TreaTopWidgetDjheidowState();
}

class _TreaTopWidgetDjheidowState extends TreaFaWState<TreaTopWidgetDjheidow>{
  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images_treasure124/fjeijdie.webp'),
        fit: BoxFit.fill,
      ),
    ),
    child: SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.only(left: 16.w,bottom: 16.h,right: 16.w),
        child: Row(
          children: [
            Visibility(
              visible: !widget.fromHome,
              child: TreaClickDhwidjow(
                onTap: (){

                },
                child: TreaImageDhwudhiw(name: "dwodow",width: 38.w,height: 26.h,),
              ),
            ),
            SizedBox(width: 16.w,),
            _moneyWidget(),
            SizedBox(width: 12.w,),
            _levelWidget(),
            Spacer(),
            TreaClickDhwidjow(
              onTap: (){

              },
              child: TreaImageDhwudhiw(name: "djwjow",width: 30.w,height: 30.w,),
            )
          ],
        ),
      ),
    ),
  );

  _moneyWidget()=>Stack(
    alignment: Alignment.centerLeft,
    children: [
      Container(
        width: 102.w,
        height: 22.h,
        margin: EdgeInsets.only(left: 16.w),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            TreaImageDhwudhiw(name: "iwdjiw",width: 102.w,height: 22.h,),
            Container(
              width: 102.w,
              height: 22.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.w),
              child: TreaTextDwihdw(data: "\$${bMyMoney.getData()}", size: 15.sp, color: "#FFFFFF"),
            ),
          ],
        ),
      ),
      TreaImageDhwudhiw(name: "icon_money",width: 40.w,height: 37.h,),
    ],
  );
  
  _levelWidget(){
    var level = TreaLevelHepDwifnowe.instance.handleLevel();
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 102.w,
          height: 22.h,
          margin: EdgeInsets.only(left: 16.w),
          child: Stack(
            children: [
              TreaImageDhwudhiw(name: "iwdjiw",width: 102.w,height: 22.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 1.w),
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: getPro(level),
                      child: TreaImageDhwudhiw(name: "dwjidjiw",width: 100.w,height: 20.h,),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TreaTextDwihdw(data: getProText(level), size: 13.sp, color: "#FFFFFF",lineColor: "#000000",),
              ),
            ],
          ),
        ),
        TreaImageDhwudhiw(name: "djwomcmc",width: 40.w,height: 30.h,),
      ],
    );
  }

  String getProText(TreaLevelBeanJwijfo level){
    if(level.currentProgress<=0&&level.totalProgress<=0){
      var max = TreaLevelHepDwifnowe.instance.getMax();
      return "$max/$max";
    }
    return "${level.currentProgress}/${level.totalProgress}";
  }

  double getPro(TreaLevelBeanJwijfo level){
    if(level.currentProgress<=0&&level.totalProgress<=0){
      return 1.0;
    }
    if(level.totalProgress<=0){
      return 0.0;
    }
    var d = level.currentProgress/level.totalProgress;
    if(d<0){
      return 0.0;
    }else if(d>1){
      return 1.0;
    }else{
      return d;
    }
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateMoneyNum:
      case TreaEventCodeDhwdhwi.updateGuaKaNum:
        setState(() {});
        break;
    }
  }
}