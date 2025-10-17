import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treasure124/trea_common/trea_launch_dwhiw/trea_launch_dwhiw_c.dart';

class TreaLaunchDwhiw extends TreaFaP<TreaLaunchDwhiwC>{
  @override
  TreaLaunchDwhiwC cccDiheiwidow() => TreaLaunchDwhiwC();

  @override
  Widget wwwdwjidwo() => Stack(
    alignment: Alignment.center,
    children: [
      TreaImageDhwudhiw(name: "dwhdiw",width: double.infinity,height: double.infinity,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TreaImageDhwudhiw(name: "djwidjiw",width: double.infinity,boxFit: BoxFit.fitWidth,),
          SizedBox(height: 140.h,),
          _progressWidget(),
        ],
      )
    ],
  );

  _progressWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GetBuilder<TreaLaunchDwhiwC>(
        id: "pro_text",
        builder: (_)=>TreaTextDwihdw(data: "Loading...  ${(treaC.controller.value*100).toInt()}%", size: 15.sp, color: "#FFFFFF",lineColor: "#000000",),
      ),
      SizedBox(height: 4.h,),
      Stack(
        alignment: Alignment.centerLeft,
        children: [
          TreaImageDhwudhiw(name: "djwidwdw",width: 283.w,height: 20.h,),
          Container(
            margin: EdgeInsets.only(left: 4.w),
            child: GetBuilder<TreaLaunchDwhiwC>(
              id: "pro",
              builder: (_)=>ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: treaC.controller.value,
                  child: TreaImageDhwudhiw(name: "djidwjwfef",width: 275.w,height: 12.h,),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}