import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_rank_dialog_dwiehiw/trea_rank_dialog_dwiehiw_c.dart';

class TreaRankDialogDwiehiw extends TreaFaD<TreaRankDialogDwiehiwC>{
  TreaCashTaskInfoBeanWiodow taskInfo;
  Function(bool completed) dismissCallback;
  TreaRankDialogDwiehiw({
    required this.taskInfo,
    required this.dismissCallback,
});

  @override
  TreaRankDialogDwiehiwC cccDiheiwidow() => TreaRankDialogDwiehiwC(taskInfo,dismissCallback);


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
            _rankInfoWidget(),
            SizedBox(height: 4.h,),
            _rankListWidget(),
            SizedBox(height: 12.h,),
            TreaTextDwihdw(data: "We have secured the bank's VIP channel，no need to wait to watch ads, \$1000 Cash out faster！", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
            SizedBox(height: 30.h,),
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

  _btnWidget()=> TreaClickDhwidjow(
    onTap: (){
      treaC.clickSkip();
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
      child: TreaTextDwihdw(data: "Skip Wait", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
    ),
  );

  _rankInfoWidget()=>GetBuilder<TreaRankDialogDwiehiwC>(
    id: "rank_text",
    builder: (_)=>RichText(
      text: TextSpan(
          children: [
            //334 in queue,Your Current rank:225
            TextSpan(
              text: "${treaC.taskInfo.totalProgress??0}",
              style: TextStyle(
                fontSize: 16.sp,
                color: "#FF4B4B".toColordwdowfw(),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " in queue,Your Current rank:",
              style: TextStyle(
                fontSize: 16.sp,
                color: "#000000".toColordwdowfw(),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "${treaC.taskInfo.currentProgress??0}",
              style: TextStyle(
                fontSize: 16.sp,
                color: "#325BCD".toColordwdowfw(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
      ),
    ),
  );

  _rankListWidget()=>Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: "#FFFFFF".toColordwdowfw(),
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 25.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: "#D5E4F8".toColordwdowfw().withOpacity(0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.w),
              topRight: Radius.circular(12.w),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: TreaTextDwihdw(data: "UserID", size: 12.sp, color: "#3B3651",fontWeight: FontWeight.bold,),
                ),
              ),
              Expanded(
                child: Center(
                  child: TreaTextDwihdw(data: "Account", size: 12.sp, color: "#3B3651",fontWeight: FontWeight.bold,),
                ),
              ),
              Expanded(
                child: Center(
                  child: TreaTextDwihdw(data: "Amount", size: 12.sp, color: "#3B3651",fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 140.h,
          child: GetBuilder<TreaRankDialogDwiehiwC>(
            id: "list",
            builder: (_)=>ListView.builder(
              itemCount: treaC.rankList.length,
              controller: treaC.scrollController,
              itemBuilder: (context,index){
                var bean = treaC.rankList[index];
                return Container(
                  width: double.infinity,
                  height: 24.h,
                  alignment: Alignment.center,
                  color: "#FFFFFF".toColordwdowfw(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TreaTextDwihdw(data: treaC.getUserId(index+1), size: 12.sp, color: bean.isMe?"#FF4B4B":"#3B3651",fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: TreaTextDwihdw(data: bean.account, size: 12.sp, color: bean.isMe?"#FF4B4B":"#3B3651",fontWeight: FontWeight.bold,),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: TreaTextDwihdw(data: "\$ ${bean.amount}", size: 12.sp, color: bean.isMe?"#FF4B4B":"#3B3651",fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
              ),
            ),
            Container(
              width: double.infinity,
              height: 3.h,
              margin: EdgeInsets.only(left: 8.w,right: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 3.h,
                      color: "#38F182".toColordwdowfw(),
                    ),
                  ),
                  Spacer(),
                ],
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