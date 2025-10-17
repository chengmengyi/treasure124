import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_level_up_dialog_dwidjiw/trea_level_up_dialog_dwidjiw_c.dart';

class TreaLevelUpDialogDwidjiw extends TreaFaD<TreaLevelUpDialogDwidjiwC>{
  Function() dismissCallback;
  TreaLevelUpDialogDwidjiw({
    required this.dismissCallback,
});

  @override
  TreaLevelUpDialogDwidjiwC cccDiheiwidow() => TreaLevelUpDialogDwidjiwC(
    dismissCallback: dismissCallback,
  );

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _titleWidget(),
      _contentWidget(),
      _btnWidget(),
    ],
  );
  
  _titleWidget()=>Stack(
    alignment: Alignment.center,
    children: [
      TreaImageDhwudhiw(name: "dmiwdoiw",width: 300.w,height: 50.h,),
      TreaGradientTextDhwiodw(
        data: "Level up",
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

  _contentWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          TreaImageDhwudhiw(name: "dmiwx",width: 244.w,height: 244.w,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TreaTextDwihdw(data: "Intermediate", size: 24.sp, color: "#FFFFFF",lineColor: "#000000",fontWeight: FontWeight.w900,),
              SizedBox(height: 36.h,),
              TreaImageDhwudhiw(name: "mowmomdw",width: 116.w,height: 86.h,),
            ],
          ),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TreaImageDhwudhiw(name: "icon_money2",width: 77.w,height: 77.w,),
          SizedBox(width: 10.w,),
          TreaGradientTextDhwiodw(
            data: "+\$${treaC.reward}",
            size: 40.sp,
            fontWeight: FontWeight.w900,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ["#FFD70F".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFFFFF".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFD70F".toColordwdowfw()],
            ),
          ),
        ],
      )
    ],
  );

  _btnWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickDouble();
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
                  TreaTextDwihdw(data: "Claim \$${doubleDecimal(treaC.reward)}", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.w900,lineColor: "#2B8945",),
                ],
              ),
            ),
            TreaImageDhwudhiw(name: "dniwn",width: 28.w,height: 28.w,),
          ],
        ),
      ),
      SizedBox(height: 12.h,),
      GetBuilder<TreaLevelUpDialogDwidjiwC>(
        id: "single_btn",
        builder: (_)=>Visibility(
          visible: treaC.showSingle,
          child: TreaClickDhwidjow(
            onTap: (){
              treaC.clickSingle();
            },
            child: TreaTextDwihdw(data: "\$${treaC.reward}", size: 20.sp, color: "#CEDFE3",fontWeight: FontWeight.w900,),
          ),
        ),
      ),
    ],
  );
}