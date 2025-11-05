import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/dialog/trea_no_ad_dialog_dwijow/trea_no_ad_dialog_dwijow_c.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';

class TreaNoAdDialogDwijow extends TreaFaD<TreaNoAdDialogDwijowC>{
  Function() tryAgainCallback;
  Function() closeCallback;
  TreaNoAdDialogDwijow({
    required this.tryAgainCallback,
    required this.closeCallback,
});

  @override
  TreaNoAdDialogDwijowC cccDiheiwidow() => TreaNoAdDialogDwijowC();

  @override
  Widget wwwdwjidwo() =>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(left: 34.w,right: 34.w),
        decoration: BoxDecoration(
          color: "#F2FAFF".toColordwdowfw(),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TreaTextDwihdw(data: "Ad loading failed", size: 20.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            SizedBox(height: 16.h,),
            TreaImageDhwudhiw(name: "fail1",width: 144.w,height: 144.w,),
            SizedBox(height: 32.h,),
            TreaClickDhwidjow(
              onTap: (){
                treaC.clickTryAgain(tryAgainCallback);
              },
              child: Container(
                width: 174.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: ["#192B67".toColordwdowfw(),"#3256CD".toColordwdowfw(),],
                  ),
                ),
                child: TreaTextDwihdw(data: "Try again", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 27.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickClose(closeCallback);
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );
}