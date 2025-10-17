import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/scratcher/scratcher.dart';
import 'package:treadwkd_bbbase/ui/trea_breath_widget_cjeidfjoe.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_wealth_dmwidm/trea_wealth_dmwidm_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_card_base_widget_fjwidjiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_title_animator_widget_dowdmow.dart';

class TreaWealthDmwidm extends TreaFaP<TreaWealthDmwidmC>{
  @override
  TreaWealthDmwidmC cccDiheiwidow() => TreaWealthDmwidmC();

  @override
  Widget wwwdwjidwo() => TreaCardBaseWidgetFjwidjiw(
    playHepDnwidow: treaC.playHepDnwidow,
    child: _childWidget(),
  );

  _childWidget()=>SizedBox(
    width: double.infinity,
    height: 525.h,
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "mdomdo",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: TreaPlayTitleAnimatorWidgetDowdmow(
              child: TreaImageDhwudhiw(name: "dwidmwi",width: 236.w,height: 150.h,),
            ),
          ),
        ),
        _playWidget(),
      ],
    ),
  );

  _playWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 23.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16.w,right: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.w),
            color: "#A25CDF".toColordwdowfw(),
            border: Border.all(
              width: 1.w,
              color: "#FCFF30".toColordwdowfw(),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Find 3 identical  collectibles
              TreaTextDwihdw(data: "Find ", size: 14.sp, color: "#FFFFFF",lineColor: "#371401",fontWeight: FontWeight.w900,),
              TreaTextDwihdw(data: "3", size: 14.sp, color: "#FBF210",lineColor: "#371401",fontWeight: FontWeight.w900,),
              TreaTextDwihdw(data: " identical  collectibles", size: 14.sp, color: "#FFFFFF",lineColor: "#371401",fontWeight: FontWeight.w900,),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 333.h,
          margin: EdgeInsets.all(16.w),
          child: GetBuilder<TreaWealthDmwidmC>(
            id: "list",
            builder: (_)=>Scratcher(
              key: treaC.playHepDnwidow.scratcherKey,
              enabled: true,
              brushSize: 40,
              threshold: 40,
              color: Colors.transparent,
              image: Image.asset('assets/images_treasure124/dmiwdniw.webp',fit: BoxFit.fill,),
              onThreshold: (){
                treaC.playHepDnwidow.playEnd();
              },
              onScratchUpdate: (details){

              },
              onScratchStart: (){

              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  TreaImageDhwudhiw(name: "dmwidmiw",width: double.infinity,height: double.infinity,),
                  MasonryGridView.count(
                    padding: const EdgeInsets.all(0),
                    itemCount: treaC.playHepDnwidow.rewardList.length,
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>_playItemWidget(treaC.playHepDnwidow.rewardList[index]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  _playItemWidget(TreaRewardItemBeanDwod bean)=>TreaBreathWidgetCjeidfjoe(
    start: bean.win,
    child: SizedBox(
      width: double.infinity,
      height: 66.6.h,
      child: Stack(
        children: [
          _playIconWidget(bean),
          _playRewardWidget(bean),
        ],
      ),
    ),
  );

  _playIconWidget(TreaRewardItemBeanDwod bean){
    if(bean.isKey){
      if(!bean.showKey){
        return Container();
      }
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          key: treaC.playHepDnwidow.keyGlobalKey,
          child: TreaImageDhwudhiw(name: bean.content,width: 40.w,height: 40.h,),
        ),
      );
    }
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 4.h),
        child: TreaImageDhwudhiw(name: bean.content,width: 30.w,height: 30.h,),
      ),
    );
  }

  _playRewardWidget(TreaRewardItemBeanDwod bean){
    if(bean.isKey){
      return Container();
    }else{
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 4.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TreaImageDhwudhiw(name: "icon_money",width: 26.w,height: 26.w,),
              TreaTextDwihdw(data: "${bean.reward}", size: 16.sp, color: "#585E6A",fontWeight: FontWeight.w900,),
            ],
          ),
        ),
      );
    }
  }
}