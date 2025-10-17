import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_reward_dialog_cwidmdw/trea_no_reward_dialog_cwidmdw_c.dart';

class TreaNoRewardDialogCwidmdw extends TreaFaD<TreaNoRewardDialogCwidmdwC>{
  Function() dismissCallback;
  TreaNoRewardDialogCwidmdw({
    required this.dismissCallback,
});
  @override
  TreaNoRewardDialogCwidmdwC cccDiheiwidow() => TreaNoRewardDialogCwidmdwC();

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TreaImageDhwudhiw(name: "diwmdowm",height: 100.h,boxFit: BoxFit.fitHeight,),
      SizedBox(height: 40.h,),
      TreaImageDhwudhiw(name: "mdiwdiwm",width: 140.w,height: 140.w,),
      SizedBox(height: 56.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickContinue(dismissCallback);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            TreaImageDhwudhiw(name: "dmiowodmw",width: 154.w,height: 46.h,),
            TreaTextDwihdw(data: "Continue", size: 24.sp, color: "#FFFFFF",lineColor: "#2B4589",fontWeight: FontWeight.bold,),
          ],
        ),
      ),
    ],
  );
}