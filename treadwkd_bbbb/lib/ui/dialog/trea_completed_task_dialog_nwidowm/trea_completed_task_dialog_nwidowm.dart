import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_completed_task_dialog_nwidowm/trea_completed_task_dialog_nwidowm_c.dart';

class TreaCompletedTaskDialogNwidowm extends TreaFaD<TreaCompletedTaskDialogNwidowmC>{
  Function() dismissCallback;
  TreaCompletedTaskDialogNwidowm({
    required this.dismissCallback,
});
  @override
  TreaCompletedTaskDialogNwidowmC cccDiheiwidow() => TreaCompletedTaskDialogNwidowmC();

  @override
  Widget wwwdwjidwo() =>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _titleWidget(),
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
            _contentWidget(),
            TreaTextDwihdw(data: "Congratulations! Your withdrawal request has been successful", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
            SizedBox(height: 33.h,),
            _btnWidget(),
          ],
        ),
      ),
      SizedBox(height: 27.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.click(dismissCallback);
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );

  _btnWidget()=> TreaClickDhwidjow(
    onTap: (){
      treaC.click(dismissCallback);
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
      child: TreaTextDwihdw(data: "Go", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
    ),
  );

  _contentWidget()=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      TreaImageDhwudhiw(name: "yiewisji",width: double.infinity,height: 240.h,),
      Container(
        margin: EdgeInsets.only(bottom: 30.h),
        child: TreaImageDhwudhiw(name: "uqhindin",width: 70.w,height: 70.w,),
      ),
    ],
  );

  _titleWidget()=>Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 34.w,right: 34.w),
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "ywiehiwns",width: double.infinity,height: 50.h,),
        TreaTextDwihdw(data: "Congratulations!", size: 30.sp, color: "#FBFF00",fontWeight: FontWeight.bold,lineColor: "#4656FF",),
      ],
    ),
  );
}