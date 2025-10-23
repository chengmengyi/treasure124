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
      _topWidget(),
      _textWidget(),
      _contentWidget(),
      _btnWidget(),
    ],
  );

  _textWidget()=>Column(
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
      SizedBox(height: 8.h,),
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
    ],
  );

  _contentWidget()=>Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 12.w,right: 12.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              TreaImageDhwudhiw(name: "wjijewm",width: double.infinity,height: 174.h,),
              TreaImageDhwudhiw(name: "jhwiiwj",width: double.infinity,height: 232.h,),
              _rollerWidget(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.h),
          child: AnimatedBuilder(
            animation: treaC.tiltAnimation,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(treaC.tiltAnimation.value),
                child: child,
              );
            },
            child: TreaImageDhwudhiw(name: "wuhun",width: 26.w,height: 84.h,),
          ),
        ),
      ],
    ),
  );

  _rollerWidget()=>MasonryGridView.count(
    padding: const EdgeInsets.all(0),
    itemCount: treaC.iconsList.length,
    shrinkWrap: true,
    crossAxisCount: 3,
    mainAxisSpacing: 0,
    crossAxisSpacing: 0,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context,largeIndwx){
      var list = treaC.iconsList[largeIndwx];
      return SizedBox(
        width: double.infinity,
        height: treaC.itemHeight*3,
        child: ListWheelScrollView.useDelegate(
          controller: treaC.controllers[largeIndwx],
          physics: const FixedExtentScrollPhysics(),
          itemExtent: treaC.itemHeight,
          perspective: 0.002,
          diameterRatio: 2.5,
          overAndUnderCenterOpacity: 0.3,
          squeeze: 1.0,
          renderChildrenOutsideViewport: false,
          childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, smallIndex) {
              var icon = list[smallIndex % 3];
              return Container(
                width: double.infinity,
                height: treaC.itemHeight,
                alignment: Alignment.center,
                child: TreaImageDhwudhiw(name: icon,width: 40.w,height: 40.w,),
              );
            },
            childCount: 300,
          ),
        ),
      );
    },
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

  _topWidget()=>Stack(
    children: [
      Container(
        margin: EdgeInsets.only(left: 38.w,right: 38.w),
        child: TreaImageDhwudhiw(name: "modwmomwo",width: double.infinity,height: 192.h,),
      ),
      Positioned(
        top: 40.h,
        right: 38.w,
        child: TreaClickDhwidjow(
          onTap: (){
            treaC.clickClose();
          },
          child: TreaImageDhwudhiw(name: "icon_close",width: 24.w,height: 24.w,),
        ),
      ),
    ],
  );
}