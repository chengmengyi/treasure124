import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_box_num_dialog_doowdwju/trea_no_box_num_dialog_doowdwju_c.dart';

class TreaNoBoxNumDialogDoowdwju extends TreaFaD<TreaNoBoxNumDialogDoowdwjuC>{
  bool fromHome;
  TreaNoBoxNumDialogDoowdwju({
    required this.fromHome,
});

  @override
  TreaNoBoxNumDialogDoowdwjuC cccDiheiwidow() => TreaNoBoxNumDialogDoowdwjuC();

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
        TreaImageDhwudhiw(name: "jdsiwdjow",width: 145.w,height: 111.h,),
        SizedBox(height: 10.h,),
        TreaTextDwihdw(data: "Head to scratch cards", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        TreaTextDwihdw(data: "and earn more chances!", size: 16.sp, color: "#342C6C",fontWeight: FontWeight.bold,),
        SizedBox(height: 6.h,),
        _btnWidget(),
        SizedBox(height: 28.h,),
      ],
    ),
  );
  
  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickGo(fromHome);
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
      child: TreaTextDwihdw(data: "No More Chance", size: 20.sp, color: "#FFFFFF",lineColor: "#2974D6",fontWeight: FontWeight.bold,),
    ),
  );
}