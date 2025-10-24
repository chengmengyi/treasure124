import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_finger_widget_djiwji.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';

class TreaNewUserGuide1View extends StatelessWidget{
  Offset offset;
  Size size;
  Function() clickCallback;
  TreaNewUserGuide1View({
    required this.offset,
    required this.size,
    required this.clickCallback,
});

  @override
  Widget build(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: TreaClickDhwidjow(
      onTap: (){
        clickCallback.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.7),
        child: Stack(
          children: [
            Positioned(
              top: offset.dy,
              left: offset.dx,
              child: _viewWidget(),
            ),
            Positioned(
              top: offset.dy+80.h,
              left: offset.dx+30.w,
              child: TreaFingerWidgetDjiwji(),
            ),
          ],
        ),
      ),
    ),
  );

  _viewWidget()=>SizedBox(
    width: size.width,
    height: size.height,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(3.w),
          child: TreaImageDhwudhiw(name: "home_77",width: double.infinity,height: double.infinity,),
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
                      TreaTextDwihdw(data: "10", size: 10.sp, color: "#FFDC16",lineColor: "#000000",),
                      TreaTextDwihdw(data: "/10", size: 10.sp, color: "#FFFFFF",lineColor: "#000000",),
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                TreaImageDhwudhiw(name: "dniwdiwmk",height: 28.h,boxFit: BoxFit.fitHeight,),
                TreaTextDwihdw(data: "Play", size: 13.sp, color: "#FFFFFF",lineColor: "#00633F",fontWeight: FontWeight.w900,),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}