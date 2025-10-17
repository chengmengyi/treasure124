import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_chance_dialog_cnidniw/trea_no_chance_dialog_cnidniw_c.dart';

class TreaNoChanceDialogCnidniw extends TreaFaD<TreaNoChanceDialogCnidniwC>{
  String playType;
  Function() clickCloseCallback;
  TreaNoChanceDialogCnidniw({
    required this.playType,
    required this.clickCloseCallback,
});

  @override
  TreaNoChanceDialogCnidniwC cccDiheiwidow() => TreaNoChanceDialogCnidniwC();

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _closeWidget(),
      SizedBox(height: 14.h,),
      _titleWidget(),
      _contentWidget(),
      _btnWidget(),
    ],
  );
  
  _closeWidget()=>Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickClose(clickCloseCallback);
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 38.w,height: 38.w,),
      ),
      SizedBox(width: 38.w,),
    ],
  );

  _titleWidget()=>Stack(
    alignment: Alignment.center,
    children: [
      TreaImageDhwudhiw(name: "dmiwdoiw",width: 300.w,height: 50.h,),
      TreaGradientTextDhwiodw(
        data: "Get More Cards",
        size: 28.sp,
        lineColor: "#D83507",
        fontWeight: FontWeight.w900,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ["#EAFF00".toColordwdowfw(),"#FFD500".toColordwdowfw(),],
        ),
      ),
    ],
  );

  _contentWidget()=>SizedBox(
    width: 250.w,
    height: 250.w,
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "dmwomdowm",width: 250.w,height: 250.w,),
        Align(
          child: TreaImageDhwudhiw(name: "dmwmodwm",width: 125.w,height: 125.w,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TreaGradientTextDhwiodw(
            data: "+5",
            size: 40.sp,
            fontWeight: FontWeight.w900,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ["#FFD70F".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFFFFF".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFD70F".toColordwdowfw()],
            ),
          ),
        ),
      ],
    ),
  );

  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickGet(playType);
    },
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.only(top: 12.h),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TreaImageDhwudhiw(name: "nciwicw",width: 210.w,height: 46.h,),
              TreaTextDwihdw(data: "Free", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.w900,lineColor: "#2B8945",),
            ],
          ),
        ),
        TreaImageDhwudhiw(name: "dniwn",width: 28.w,height: 28.w,),
      ],
    ),
  );
}