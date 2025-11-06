import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_open_notification_dialog_dniwdow/trea_open_notification_dialog_dniwdow_c.dart';

class TreaOpenNotificationDialogDniwdow extends TreaFaD<TreaOpenNotificationDialogDniwdowC>{
  @override
  TreaOpenNotificationDialogDniwdowC cccDiheiwidow() => TreaOpenNotificationDialogDniwdowC();

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
            TreaTextDwihdw(data: "Cash Reward Reminder", size: 20.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            SizedBox(height: 10.h,),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.h,right: 100.w),
                  child: TreaImageDhwudhiw(name: "womowmow",width: 87.w,height: 50.h,),
                ),
                TreaImageDhwudhiw(name: "dniwmdiwm",width: 120.w,height: 105.h,),
                Container(
                  margin: EdgeInsets.only(left: 100.w),
                  child: TreaImageDhwudhiw(name: "wdniwdimw",width: 87.w,height: 50.h,),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            TreaTextDwihdw(data: "Enable permissions for instant cash alerts – huge rewards waiting! Act now!", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
            SizedBox(height: 10.h,),
            TreaClickDhwidjow(
              onTap: (){
                treaC.clickOpen();
              },
              child: Container(
                width: 173.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: ["#192B67".toColordwdowfw(),"#3256CD".toColordwdowfw(),],
                    )
                ),
                child: TreaTextDwihdw(data: "Receive", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
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