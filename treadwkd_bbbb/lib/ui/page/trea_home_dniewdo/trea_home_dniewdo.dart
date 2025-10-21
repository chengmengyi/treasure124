import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_hep_dnwidi.dart';
import 'package:treadwkd_bbbb/ui/page/trea_home_dniewdo/trea_home_dniewdo_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_box_widget_djwidjow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_bubble_widget_djwiodw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_top_widget_djheidow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_wheel_icon_widget_djwidjiw.dart';

class TreaHomeDniewdo extends TreaFaP<TreaHomeDniewdoC>{
  @override
  TreaHomeDniewdoC cccDiheiwidow() => TreaHomeDniewdoC();

  @override
  Widget wwwdwjidwo() => Stack(
    children: [
      TreaImageDhwudhiw(name: "fkoek",width: double.infinity,height: double.infinity,),
      Column(
        children: [
          TreaTopWidgetDjheidow(fromHome: true,),
          _boxWidget(),
          SizedBox(height: 8.h,),
          Expanded(
            child: _cardListWidget(),
          ),
          _bottomWidget(),
        ],
      ),
      TreaBubbleWidgetDjwiodw(),
    ],
  );

  _cardListWidget()=>Container(
    margin: EdgeInsets.only(left: 30.w,right: 30.w),
    child: GetBuilder<TreaHomeDniewdoC>(
      id: "play_type_list",
      builder: (_)=>MasonryGridView.count(
        padding: const EdgeInsets.all(0),
        itemCount: treaC.playTypeList.length,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 22.w,
        itemBuilder: (context,index)=>_playTypeItemWidget(treaC.playTypeList[index]),
      ),
    ),
  );

  _playTypeItemWidget(TreaPlayTypeInfoFhwiedhi bean)=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickItem(bean);
    },
    child: SizedBox(
      width: double.infinity,
      height: 170.h,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(3.w),
            child: TreaImageDhwudhiw(name: treaC.getPlayTypeImages(bean),width: double.infinity,height: double.infinity,),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                TreaImageDhwudhiw(name: "mcimo",width: 47.w,height: 32.h,),
                Positioned(
                  top: 8.h,
                  right: 6.w,
                  child: Transform.rotate(
                    angle: 45 * pi / 180,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TreaTextDwihdw(data: "${bean.currentPro??0}", size: 10.sp, color: "#FFDC16",lineColor: "#000000",),
                        TreaTextDwihdw(data: "/${bean.totalPro??0}", size: 10.sp, color: "#FFFFFF",lineColor: "#000000",),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 12.h),
              child: bean.unlock==1?
              Stack(
                alignment: Alignment.center,
                children: [
                  TreaImageDhwudhiw(name: "dniwdiwmk",height: 28.h,boxFit: BoxFit.fitHeight,),
                  TreaTextDwihdw(data: "Play", size: 13.sp, color: "#FFFFFF",lineColor: "#00633F",fontWeight: FontWeight.w900,),
                ],
              ):
              TreaImageDhwudhiw(name: "dnwidniwn",height: 28.h,boxFit: BoxFit.fitHeight,),
            ),
          ),
        ],
      ),
    ),
  );

  _boxWidget()=>Row(
    children: [
      SizedBox(width: 20.w,),
      TreaBoxWidgetDjwidjow(),
      Expanded(
        child: TreaClickDhwidjow(
          onTap: (){
            treaC.test();
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
          ),
        ),
      ),
      TreaClickDhwidjow(
        onTap: (){

        },
        child: TreaImageDhwudhiw(name: "djwojdow",width: 49.w,height: 61.w,),
      ),
      SizedBox(width: 20.w,),
    ],
  );

  _bottomWidget()=>SizedBox(
    width: double.infinity,
    height: 73.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "mdowmdow",width: double.infinity,height: 73.h,),
        Row(
          children: [
            Expanded(
              child: Center(
                child: TreaWheelIconWidgetDjwidjiw(),
              ),
            ),
            Expanded(
              child: Center(
                child: TreaClickDhwidjow(
                  onTap: (){
                    treaC.clickCash();
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      TreaImageDhwudhiw(name: "mdwmom",width: 90.w,height: 54.h,),
                      TreaGradientTextDhwiodw(
                        data: "Cash",
                        size: 13.sp,
                        lineColor: "#000000",
                        fontWeight: FontWeight.bold,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}