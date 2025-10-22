import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_success_dialog_dwiiw/trea_cash_success_dialog_dwiiw_c.dart';

class TreaCashSuccessDialogDwiiw extends TreaFaD<TreaCashSuccessDialogDwiiwC>{
  TreaCashTaskInfoBeanWiodow taskInfo;
  TreaCashSuccessDialogDwiiw({
    required this.taskInfo,
});
  @override
  TreaCashSuccessDialogDwiiwC cccDiheiwidow() => TreaCashSuccessDialogDwiiwC();

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
            _topWidget(),
            SizedBox(height: 16.h,),
            TreaTextDwihdw(data: "We have completed the payment.And the funds will be creadited to your bank account within 7 business days.", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
            SizedBox(height: 16.h,),
            _btnWidget(),
          ],
        ),
      ),
      SizedBox(height: 27.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickOk(taskInfo);
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );
  
  _btnWidget()=> TreaClickDhwidjow(
    onTap: (){
      treaC.clickOk(taskInfo);
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
      child: TreaTextDwihdw(data: "ok", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
    ),
  );

  _topWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TreaTextDwihdw(data: "Review", size: 20.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
      SizedBox(height: 25.h,),
      SizedBox(
        width: double.infinity,
        height: 16.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 7.h,
              color: "#737373".toColordwdowfw(),
              margin: EdgeInsets.only(left: 8.w,right: 8.w),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 16.w,
                height: 16.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: "#737373".toColordwdowfw(),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: "#39F283".toColordwdowfw(),
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 16.w,
                height: 16.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: "#737373".toColordwdowfw(),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: "#39F283".toColordwdowfw(),
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 16.w,
                height: 16.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: "#737373".toColordwdowfw(),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: "#39F283".toColordwdowfw(),
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 3.h,
              color: "#38F182".toColordwdowfw(),
              margin: EdgeInsets.only(left: 8.w,right: 8.w),
            ),
          ],
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 30.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TreaTextDwihdw(data: "Review", size: 12.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            ),
            Align(
              alignment: Alignment.center,
              child: TreaTextDwihdw(data: "Queue", size: 12.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TreaTextDwihdw(data: "Funds received", size: 12.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    ],
  );
}