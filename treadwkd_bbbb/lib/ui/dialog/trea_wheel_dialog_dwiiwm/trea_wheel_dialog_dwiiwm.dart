import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_wheel_dialog_dwiiwm/trea_wheel_dialog_dwiiwm_c.dart';

class TreaWheelDialogDwiiwm extends TreaFaD<TreaWheelDialogDwiiwmC>{
  bool fromHome;
  TreaWheelDialogDwiiwm({
    required this.fromHome,
});
  @override
  TreaWheelDialogDwiiwmC cccDiheiwidow() => TreaWheelDialogDwiiwmC();

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 30.w,right: 30.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _titleWidget(),
        SizedBox(height: 21.h,),
        _contentWidget(),
        SizedBox(height: 45.h,),
        _btnWidget(),
      ],
    ),
  );

  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickSpin(fromHome);
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "iwmidwidn",width: 154.w,height: 46.h,),
        TreaTextDwihdw(data: "Spin", size: 24.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#2B8945",)
      ],
    ),
  );

  _contentWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        margin: EdgeInsets.only(top: 21.h),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12.w),
                child: GetBuilder<TreaWheelDialogDwiiwmC>(
                  id: "wheel",
                  builder: (_){
                    if(null==treaC.wheelAnimation){
                      return Container();
                    }
                    return LayoutBuilder(
                      builder: (context,bc){
                        var size = bc.maxWidth;
                        var radius = (size / 2 - 30)*0.9;
                        return AnimatedBuilder(
                          animation: treaC.wheelAnimation!,
                          builder: (context,child)=>Transform.rotate(
                            angle: treaC.wheelAnimation!.value,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  TreaImageDhwudhiw(name: "ijwijw",width: double.infinity,height: double.infinity,),
                                  ...List.generate(
                                    treaC.wheelList.length, (i) =>
                                      _wheelItemWidget(
                                        money: treaC.wheelList[i],
                                        angleDeg: i * 45.0 - 90,
                                        radius: radius,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              TreaImageDhwudhiw(name: "wyuwhusnw",width: double.infinity,height: double.infinity,),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  TreaImageDhwudhiw(name: "sjiwism",width: 85.w,height: 85.w,),
                  Container(
                    padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 1.h,),
                    decoration: BoxDecoration(
                      color: "#FF4949".toColordwdowfw(),
                      borderRadius: BorderRadius.circular(16.w),
                      border: Border.all(
                        width: 2.w,
                        color: "#FFFFFF".toColordwdowfw(),
                      ),
                    ),
                    child: GetBuilder<TreaWheelDialogDwiiwmC>(
                      id: "wheel_num",
                      builder: (_)=>TreaTextDwihdw(data: "${bWheelNum.getData()}", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.w900,),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      TreaImageDhwudhiw(name: "ewkowow",width: 76.w,height: 52.h,),
    ],
  );

  Widget _wheelItemWidget({
    required double money,
    required double angleDeg,
    required double radius,
  }) {
    final angleRad = angleDeg * pi / 180;
    final offset = Offset(
      radius * cos(angleRad),
      radius * sin(angleRad),
    );
    final textRotation = angleRad + pi / 2;
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: textRotation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TreaImageDhwudhiw(name: "dmiwmwjow",width: 50.w,height: 30.h,),
            SizedBox(height: 10.h,),
            TreaTextDwihdw(data: "\$$money", size: 12.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#000000",),
          ],
        ),
      ),
    );
  }
  
  _titleWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TreaClickDhwidjow(
            onTap: (){
              treaC.clickClose();
            },
            child: TreaImageDhwudhiw(name: "icon_close",width: 38.w,height: 38.w,),
          ),
        ],
      ),
      SizedBox(height: 12.h,),
      Stack(
        alignment: Alignment.center,
        children: [
          TreaImageDhwudhiw(name: "ksiwmosw",width: double.infinity,height: 50.h,),
          TreaGradientTextDhwiodw(
            data: "Wheel Cash",
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
      ),
    ],
  );
}