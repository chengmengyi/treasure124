import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_breath_widget_cjeidfjoe.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow_c.dart';

enum TreaRewardEnum{
  box,wheel,lucky,card,
}

class TreaRewardDialogJwidjow extends TreaFaD<TreaRewardDialogJwidjowC>{
  double reward;
  TreaRewardEnum rewardEnum;
  String? playType;
  Function() dismissCallback;
  TreaRewardDialogJwidjow({
    required this.reward,
    required this.rewardEnum,
    required this.dismissCallback,
    this.playType,
});

  @override
  TreaRewardDialogJwidjowC cccDiheiwidow() => TreaRewardDialogJwidjowC(
    reward: reward,
    rewardEnum: rewardEnum,
    playType: playType,
    dismissCallback: dismissCallback,
  );

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _topContentWidget(),
      SizedBox(height: 50.h,),
      _btnWidget(),
    ],
  );

  _topContentWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      TreaBreathWidgetCjeidfjoe(
        start: true,
        child: treaC.isBigReward()?
        TreaImageDhwudhiw(name: "djiwdjiw",height: 300.h,):
        TreaImageDhwudhiw(name: "ndiwnid",height: 105.h,),
      ),
      Container(
        margin: EdgeInsets.only(top: treaC.isBigReward()?260.h:150.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TreaImageDhwudhiw(name: "icon_money2",width: 77.w,height: 77.w,),
            SizedBox(width: 10.w,),
            TreaGradientTextDhwiodw(
              data: "+\$$reward",
              size: 40.sp,
              fontWeight: FontWeight.w900,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: ["#FFD70F".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFFFFF".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFD70F".toColordwdowfw()],
              ),
            ),
          ],
        ),
      ),
    ],
  );

  _btnWidget(){
    if(treaC.isBigReward()){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: !TreaGuideHepDwidmow.instance.checkIsStep3(),
            child: TreaClickDhwidjow(
              onTap: (){
                treaC.clickDouble();
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TreaImageDhwudhiw(name: "nciwicw",width: 210.w,height: 46.h,),
                        TreaTextDwihdw(data: "Claim \$${doubleDecimal(reward)}", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.w900,lineColor: "#2B8945",),
                      ],
                    ),
                  ),
                  TreaImageDhwudhiw(name: "dniwn",width: 28.w,height: 28.w,),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          GetBuilder<TreaRewardDialogJwidjowC>(
            id: "single_btn",
            builder: (_)=>Visibility(
              visible: treaC.showSingle,
              child: TreaClickDhwidjow(
                onTap: (){
                  treaC.clickSingle();
                },
                child: TreaTextDwihdw(data: "\$$reward", size: 20.sp, color: "#CEDFE3",fontWeight: FontWeight.w900,),
              ),
            ),
          ),
        ],
      );
    }else{
      return TreaClickDhwidjow(
        onTap: (){
          treaC.clickSingle();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            TreaImageDhwudhiw(name: "dmiwdiw",width: 154.w,height: 46.h,),
            TreaTextDwihdw(data: "Claim", size: 24.sp, color: "#FFFFFF",fontWeight: FontWeight.w900,lineColor: "#2B8945",)
          ],
        ),
      );
    }
  }
}