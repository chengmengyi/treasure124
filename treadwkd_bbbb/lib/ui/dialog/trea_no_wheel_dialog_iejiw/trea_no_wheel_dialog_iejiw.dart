import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_wheel_dialog_iejiw/trea_no_wheel_dialog_iejiw_c.dart';

class TreaNoWheelDialogIejiw extends TreaFaD<TreaNoWheelDialogIejiwC>{
  Function(bool go) dismissCallback;
  TreaNoWheelDialogIejiw({
    required this.dismissCallback,
});
  @override
  TreaNoWheelDialogIejiwC cccDiheiwidow() => TreaNoWheelDialogIejiwC();

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    height: 296.h,
    margin: EdgeInsets.only(left: 35.w,right: 35.w,),
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "smwimo",width: double.infinity,height: 300.h,),
        _contentWidget(),
        Positioned(
          top: 0,
          right: 12.w,
          child: TreaClickDhwidjow(
            onTap: (){
              treaC.clickClose(dismissCallback);
            },
            child: TreaImageDhwudhiw(name: "icon_close",width: 24.w,height: 24.w,),
          ),
        ),
      ],
    ),
  );

  _contentWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TreaImageDhwudhiw(name: "sowow",width: 113.w,height: 87.h,),
        SizedBox(height: 14.h,),
        TreaTextDwihdw(data: "Head to scratch cards", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        TreaTextDwihdw(data: "and earn more wheel spins!", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        SizedBox(height: 16.h,),
        _btnWidget(),
        SizedBox(height: 28.h,),
      ],
    ),
  );
  
  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickGo(dismissCallback);
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "jiwiejwim",width: 154.w,height: 46.h,),
        TreaTextDwihdw(data: "GO", size: 24.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#892B2C",)
      ],
    ),
  );

  _titleWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 8.h),
      child: TreaTextDwihdw(data: "Unlock Level", size: 20.sp, color: "#FFFFFF",lineColor: "#2974D6",fontWeight: FontWeight.bold,),
    ),
  );
}