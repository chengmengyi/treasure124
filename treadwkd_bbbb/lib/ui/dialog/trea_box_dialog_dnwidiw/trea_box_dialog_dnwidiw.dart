import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_box_dialog_dnwidiw/trea_box_dialog_dnwidiw_c.dart';


class TreaBoxDialogDnwidiw extends TreaFaD<TreaBoxDialogDnwidiwC>{
  @override
  TreaBoxDialogDnwidiwC cccDiheiwidow() => TreaBoxDialogDnwidiwC();

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: double.infinity,
        height: 570.h,
        // margin: EdgeInsets.only(left: 35.w,right: 35.w),
        child: Stack(
          children: [
            TreaImageDhwudhiw(name: "mdiwmimd",width: double.infinity,height: double.infinity,),
            _contentWidget(),
            Positioned(
              top: 40.h,
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
      ),
      SizedBox(height: 58.h,),
      _btnWidget(),
    ],
  );

  _contentWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TreaGradientTextDhwiodw(
          data: "Check in earn 3 Treasure",
          size: 20.sp,
          fontWeight: FontWeight.w900,
          lineColor: "#000000",
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),"#FFFF00".toColordwdowfw()],
          ),
        ),
        TreaGradientTextDhwiodw(
          data: "Chest Draw chaces",
          size: 20.sp,
          fontWeight: FontWeight.w900,
          lineColor: "#000000",
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),"#FFFF00".toColordwdowfw()],
          ),
        ),
        SizedBox(height: 20.h,),
        Stack(
          alignment: Alignment.center,
          children: [
            _rollerBgWidget(),
            _rollerWidget(),
          ],
        ),
        SizedBox(height: 40.h,),
      ],
    ),
  );

  _rollerBgWidget()=>Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _rollerBgItemWidget(false),
          _rollerBgItemWidget(true),
          _rollerBgItemWidget(false),
        ],
      ),
      SizedBox(width: 18.w,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _rollerBgItemWidget(false),
          _rollerBgItemWidget(true),
          _rollerBgItemWidget(false),
        ],
      ),
      SizedBox(width: 18.w,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _rollerBgItemWidget(false),
          _rollerBgItemWidget(true),
          _rollerBgItemWidget(false),
        ],
      ),
    ],
  );

  _rollerBgItemWidget(bool center)=>Container(
    width: 85.w,
    height: treaC.itemHeight,
    alignment: Alignment.center,
    child: TreaImageDhwudhiw(name: center?"dmwidiw":"mdiwmdow",width: 85.w,height: 85.w,),
  );
  // {
  //   if(center){
  //     return TreaImageDhwudhiw(name: "dmwidiw",width: 85.w,height: 85.w,);
  //   }
  //   return TreaImageDhwudhiw(name: "mdiwmdow",width: 85.w,height: 85.w,);
  // }

  _rollerWidget()=>Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 85.w,
        height: treaC.itemHeight*3,
        child: ListView.builder(
          controller: treaC.controllers[0],
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3000,
          itemBuilder: (context, index) {
            var icon = treaC.iconList1[index % 3];
            return Container(
              width: 85.w,
              height: treaC.itemHeight,
              alignment: Alignment.center,
              child: TreaImageDhwudhiw(name: icon,width: 55.w,height: 55.w,),
            );
          },
        ),
      ),
      SizedBox(width: 18.w,),
      SizedBox(
        width: 85.w,
        height: treaC.itemHeight*3,
        child: ListView.builder(
          controller: treaC.controllers[1],
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3000,
          itemBuilder: (context, index) {
            var icon = treaC.iconList2[index % 3];
            return Container(
              width: 85.w,
              height: treaC.itemHeight,
              alignment: Alignment.center,
              child: TreaImageDhwudhiw(name: icon,width: 55.w,height: 55.w,),
            );
          },
        ),
      ),
      SizedBox(width: 18.w,),
      SizedBox(
        width: 85.w,
        height: treaC.itemHeight*3,
        child: ListView.builder(
          controller: treaC.controllers[2],
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3000,
          itemBuilder: (context, index) {
            var icon = treaC.iconList3[index % 3];
            return Container(
              width: 85.w,
              height: treaC.itemHeight,
              alignment: Alignment.center,
              child: TreaImageDhwudhiw(name: icon,width: 55.w,height: 55.w,),
            );
          },
        ),
      ),
    ],
  );

  _btnWidget()=>GetBuilder<TreaBoxDialogDnwidiwC>(
    id: "btn",
    builder: (_)=>TreaClickDhwidjow(
      onTap: (){
        treaC.clickSpin();
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          TreaImageDhwudhiw(name: "nciwndinw",width: 154.w,height: 46.h,),
          Container(
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
            child: TreaTextDwihdw(data: "${treaC.boxNum}", size: 12.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    ),
  );
}