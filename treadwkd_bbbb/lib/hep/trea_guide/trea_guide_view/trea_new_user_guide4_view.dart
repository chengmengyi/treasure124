import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/trea_finger_widget_djiwji.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaNewUserGuide4View extends StatelessWidget{
  Offset offset;
  Function() clickCallback;
  TreaNewUserGuide4View({
    required this.offset,
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
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: 102.w,
                    height: 22.h,
                    margin: EdgeInsets.only(left: 16.w),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        TreaImageDhwudhiw(name: "iwdjiw",width: 102.w,height: 22.h,),
                        Container(
                          width: 102.w,
                          height: 22.h,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20.w),
                          child: TreaTextDwihdw(data: "\$${bMyMoney.getData()}", size: 15.sp, color: "#FFFFFF"),
                        ),
                      ],
                    ),
                  ),
                  TreaImageDhwudhiw(name: "icon_money",width: 40.w,height: 37.h,),
                ],
              ),
            ),
            Positioned(
              top: offset.dy,
              left: offset.dx,
              child: TreaFingerWidgetDjiwji(),
            ),
          ],
        ),
      ),
    ),
  );
}