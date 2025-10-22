import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_task_dialog_dwidijw/trea_cash_task_dialog_dwidijw_c.dart';

class TreaCashTaskDialogDwidijw extends TreaFaD<TreaCashTaskDialogDwidijwC>{
  TreaCashTaskInfoBeanWiodow? cashTaskInfo;
  Function() clickGoCallback;
  TreaCashTaskDialogDwidijw({
    required this.cashTaskInfo,
    required this.clickGoCallback,
});

  @override
  TreaCashTaskDialogDwidijwC cccDiheiwidow() => TreaCashTaskDialogDwidijwC();

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
            _contentWidget(),
            SizedBox(height: 16.h,),
            _btnWidget(),
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
  
  _contentWidget()=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.w),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: ["#D0EDFF".toColordwdowfw(),"#E0F3FF".toColordwdowfw(),]
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TreaTextDwihdw(data: "Complete 3", size: 16.sp, color: "#000000",fontWeight: FontWeight.bold,),
        SizedBox(height: 6.h,),
        TreaTextDwihdw(data: "tasks to verify you’re human.", size: 16.sp, color: "#000000",fontWeight: FontWeight.bold,),
        SizedBox(height: 22.h,),
        RichText(
          text: TextSpan(
            children: [
              //Task:   Watch 20 Ads
              TextSpan(
                text: "Task: ",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: "#000000".toColordwdowfw(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: treaC.getTaskLeftStr(cashTaskInfo),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: "#000000".toColordwdowfw(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "${cashTaskInfo?.currentProgress??0}/${cashTaskInfo?.totalProgress??0}",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: "#0051FF".toColordwdowfw(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: treaC.getTaskRightStr(cashTaskInfo),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: "#000000".toColordwdowfw(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ),
        ),
        SizedBox(height: 6.h,),
        LayoutBuilder(
          builder: (context,bc){
            var maxWidth = bc.maxWidth;
            return Container(
              width: double.infinity,
              height: 20.h,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 2.w,right: 2.w),
              decoration: BoxDecoration(
                color: "#535353".toColordwdowfw(),
                borderRadius: BorderRadius.circular(22.w),
              ),
              child: Container(
                width: maxWidth*treaC.getTaskProgress(cashTaskInfo),
                height: 16.h,
                decoration: BoxDecoration(
                  color: "#C6FF41".toColordwdowfw(),
                  borderRadius: BorderRadius.circular(22.w),
                ),
              ),
            );
          },
        ),
      ],
    ),
  );

  _btnWidget()=> TreaClickDhwidjow(
    onTap: (){
      treaC.clickGo(clickGoCallback);
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
              ),
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