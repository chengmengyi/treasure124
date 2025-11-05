import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_network_dialog_dwijow/trea_no_network_dialog_dwijow_c.dart';

class TreaNoNetworkDialogDwijow extends TreaFaD<TreaNoNetworkDialogDwijowC>{

  @override
  TreaNoNetworkDialogDwijowC cccDiheiwidow() => TreaNoNetworkDialogDwijowC();

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
            TreaTextDwihdw(data: "No network currently", size: 20.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            SizedBox(height: 16.h,),
            TreaImageDhwudhiw(name: "no_net1",width: 232.w,height: 154.h,),
            SizedBox(height: 32.h,),
            TreaClickDhwidjow(
              onTap: (){
                treaC.clickClose();
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
          treaC.clickClose();
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );
}