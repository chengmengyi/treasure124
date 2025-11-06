import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_box_hep_whidowmd.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_box_dialog_dnwidiw/trea_box_dialog_dnwidiw.dart';

class TreaBoxWidgetDjwidjow extends TreaFaW{
  Function()? clickBoxCallback;
  TreaBoxWidgetDjwidjow({
    this.clickBoxCallback,
});
  @override
  State<StatefulWidget> createState() => _TreaBoxWidgetDjwidjowState();
}

class _TreaBoxWidgetDjwidjowState extends TreaFaWState<TreaBoxWidgetDjwidjow>{
  var boxNum=0,clickFromNotification=false;

  @override
  void initState() {
    super.initState();
    _queryBoxNum();
  }

  @override
  Widget wwwdwjidwo() => TreaClickDhwidjow(
    onTap: (){
      clickFromNotification=false;
      _clickBox();
    },
    child: SizedBox(
      width: 61.w,
      height: 61.w,
      child: Stack(
        children: [
          TreaImageDhwudhiw(name: "mdiwjdiw",width: 61.w,height: 61.w,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 4.h),
              child: TreaGradientTextDhwiodw(
                data: "Treasure",
                size: 13.sp,
                lineColor: "#000000",
                fontWeight: FontWeight.bold,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),]
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 18.w,
              height: 18.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: "#FF4949".toColordwdowfw(),
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(
                  width: 2.w,
                  color: "#FFFFFF".toColordwdowfw(),
                ),
              ),
              child: TreaTextDwihdw(data: "$boxNum", size: 12.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
            ),
          )
        ],
      ),
    ),
  );

  _clickBox(){
    widget.clickBoxCallback?.call();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.treasure_icon_c);
    if(boxNum<=0){
      showToast("Attempts Exhausted. Please Try Again Tomorrow.");
      return;
    }
    TreaRouDwjidw.showDdjwidjow(
      child: TreaBoxDialogDnwidiw(
        dismissCallback: (){
          if(clickFromNotification){
            TreaGuideHepDwidmow.instance.checkShowOpenNotificationDialog();
          }
        },
      ),
    );
  }

  _queryBoxNum()async{
    boxNum = await TreaBoxHepWhidowmd.instance.queryTodayBoxNum();
    setState(() {});
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.clickBoxGuide:
        clickFromNotification=true;
        _clickBox();
        break;
    }
  }
}