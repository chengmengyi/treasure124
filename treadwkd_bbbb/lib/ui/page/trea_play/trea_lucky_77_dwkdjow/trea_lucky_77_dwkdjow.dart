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
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_lucky_77_dwkdjow/trea_lucky_77_dwkdjow_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_card_base_widget_fjwidjiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_title_animator_widget_dowdmow.dart';

class TreaLucky77Dwkdjow extends TreaFaP<TreaLucky77DwkdjowC>{
  @override
  TreaLucky77DwkdjowC cccDiheiwidow() => TreaLucky77DwkdjowC();

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
        TreaImageDhwudhiw(name: "miemofe",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: TreaPlayTitleAnimatorWidgetDowdmow(
              child: TreaImageDhwudhiw(name: "diwdiow",width: 236.w,height: 150.h,),
            ),
          ),
        ),
        _playWidget(),
      ],
    ),
  );

  _playWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: 333.h,
      margin: EdgeInsets.all(16.w),
      child: GetBuilder<TreaLucky77DwkdjowC>(
        id: "list",
        builder: (_)=>Scratcher(
          key: treaC.playHepDnwidow.scratcherKey,
          enabled: true,
          brushSize: 40,
          threshold: 40,
          color: Colors.transparent,
          image: Image.asset('assets/images_treasure124/diwdowmo.webp',fit: BoxFit.fill,),
          onThreshold: (){
            treaC.playHepDnwidow.playEnd();
          },
          onScratchUpdate: (details){

          },
          onScratchStart: (){
            treaC.playHepDnwidow.playStart();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TreaImageDhwudhiw(name: "djwodjow",width: double.infinity,height: double.infinity,),
              MasonryGridView.count(
                padding: const EdgeInsets.all(0),
                itemCount: treaC.playHepDnwidow.rewardList.length,
                shrinkWrap: true,
                crossAxisCount: 3,
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
  );

  _playItemWidget(TreaRewardItemBeanDwod bean)=>TreaBreathWidgetCjeidfjoe(
    start: bean.win||bean.isKey,
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
    if(bean.win){
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 8.h),
          child: TreaImageDhwudhiw(name: bean.content,width: 34.w,height: 25.h,),
        ),
      );
    }
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
    if(bean.isText){
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 6.h),
          child: TreaGradientTextDhwiodw(
            data: bean.content,
            size: 32.sp,
            fontWeight: FontWeight.w900,
            lineColor: "#000000",
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ["#FFFC49".toColordwdowfw(),"#D78D4D".toColordwdowfw(),]
            ),
          ),
        ),
      );
    }
    return Container();
  }

  _playRewardWidget(TreaRewardItemBeanDwod bean){
    if(bean.isKey){
      return Container();
    }else{
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 2.h),
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