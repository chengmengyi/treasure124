import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_apply_animator_dialog_djwijow/trea_apply_animator_dialog_djwijow_c.dart';

class TreaApplyAnimatorDialogDjwijow extends TreaFaD<TreaApplyAnimatorDialogDjwijowC>{
  Function() dismissCallback;
  TreaApplyAnimatorDialogDjwijow({
    required this.dismissCallback,
});
  @override
  TreaApplyAnimatorDialogDjwijowC cccDiheiwidow() => TreaApplyAnimatorDialogDjwijowC(dismissCallback);

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.w),
    margin: EdgeInsets.only(left: 34.w,right: 34.w),
    decoration: BoxDecoration(
      color: "#F2FAFF".toColordwdowfw(),
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: GetBuilder<TreaApplyAnimatorDialogDjwijowC>(
      id: "content",
      builder: (_)=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TreaTextDwihdw(data: "Request Submission in Progress", size: 14.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
          SizedBox(height: 20.h,),
          TreaImageDhwudhiw(name: "jsiwjiwm",width: 125.w,height: 125.w,),
          SizedBox(height: 12.h,),
          _progressWidget(),
          SizedBox(height: 12.h,),
          _bottomWidget(),
        ],
      ),
    ),
  );

  _progressWidget()=>SizedBox(
    width: 50.w,
    child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context,index)=>TreaImageDhwudhiw(name: treaC.showSuccess||treaC.progressIndex==index?"iwninwe":"dyuwhidw",width: 50.w,height: 30.h,),
      ),
    ),
  );

  _bottomWidget(){
    if(treaC.showSuccess){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TreaImageDhwudhiw(name: "jiqjwio2",width: 90.w,height: 90.w,),
          SizedBox(height: 10.h,),
          TreaTextDwihdw(data: "Your request has been successfully submitted and is now queued for review.", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
        ],
      );
    }
    return TreaImageDhwudhiw(name: "wteuhwuien",width: 90.w,height: 90.w,);
  }
}