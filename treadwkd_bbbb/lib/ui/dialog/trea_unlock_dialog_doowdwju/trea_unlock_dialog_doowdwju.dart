import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_unlock_dialog_doowdwju/trea_unlock_dialog_doowdwju_c.dart';

class TreaUnlockDialogDoowdwju extends TreaFaD<TreaUnlockDialogDoowdwjuC>{
  TreaPlayTypeInfoFhwiedhi bean;
  TreaUnlockDialogDoowdwju({
    required this.bean,
});

  @override
  TreaUnlockDialogDoowdwjuC cccDiheiwidow() => TreaUnlockDialogDoowdwjuC();

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    height: 296.h,
    margin: EdgeInsets.only(left: 35.w,right: 35.w,),
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "djiwmowm",width: double.infinity,height: 296.h,),
        _titleWidget(),
        _contentWidget(),
        Positioned(
          top: 0,
          right: 12.w,
          child: TreaClickDhwidjow(
            onTap: (){
              treaC.clickClose();
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
        TreaImageDhwudhiw(name: "wejiwjie",width: 123.w,height: 94.h,),
        SizedBox(height: 10.h,),
        TreaTextDwihdw(data: "Free Unlock", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        TreaTextDwihdw(data: "View ad to unlock theme", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        SizedBox(height: 6.h,),
        _btnWidget(),
        SizedBox(height: 28.h,),
      ],
    ),
  );
  
  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickGo(bean);
    },
    child: SizedBox(
      width: 154.w,
      height: 56.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                TreaImageDhwudhiw(name: "jiwiejwim",width: 154.w,height: 46.h,),
                TreaTextDwihdw(data: "GO", size: 24.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#892B2C",)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TreaImageDhwudhiw(name: "djiwjiw",width: 28.w,height: 27.h,),
          ),
        ],
      ),
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