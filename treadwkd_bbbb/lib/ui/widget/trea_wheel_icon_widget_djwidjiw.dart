import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_wheel_dialog_dwiiwm/trea_wheel_dialog_dwiiwm.dart';

class TreaWheelIconWidgetDjwidjiw extends TreaFaW{
  bool fromHome;
  TreaWheelIconWidgetDjwidjiw({
    required this.fromHome,
});
  @override
  State<StatefulWidget> createState() => _TreaWheelIconWidgetDjwidjiwState();
}

class _TreaWheelIconWidgetDjwidjiwState extends TreaFaWState<TreaWheelIconWidgetDjwidjiw>{
  @override
  Widget wwwdwjidwo() => TreaClickDhwidjow(
    onTap: (){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaWheelDialogDwiiwm(
          fromHome: widget.fromHome,
        ),
      );
    },
    child: SizedBox(
      width: 88.w,
      height: 60.h,
      child: Stack(
        children: [
          TreaImageDhwudhiw(name: "mndiwndiw",width: 88.w,height: 60.h,),
          Positioned(
            top: 8.h,
            right: 20.w,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 3.w,right: 3.w,top: 1.h,),
              decoration: BoxDecoration(
                color: "#FF4949".toColordwdowfw(),
                borderRadius: BorderRadius.circular(9.w),
                border: Border.all(
                  width: 2.w,
                  color: "#FFFFFF".toColordwdowfw(),
                ),
              ),
              child: TreaTextDwihdw(data: "${bWheelNum.getData()}", size: 12.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 4.h),
              child: TreaGradientTextDhwiodw(
                data: "Lucky spin",
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
        ],
      ),
    ),
  );

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateWheelNum:
        setState(() {});
        break;
    }
  }
}