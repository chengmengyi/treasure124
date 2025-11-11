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
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_sweet_cmefnienf/trea_sweet_cmefnienf_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_card_base_widget_fjwidjiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_title_animator_widget_dowdmow.dart';

class TreaSweetCmefnienf extends TreaFaP<TreaSweetCmefnienfC>{
  @override
  TreaSweetCmefnienfC cccDiheiwidow() => TreaSweetCmefnienfC();

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
        TreaImageDhwudhiw(name: "mmeoeomf",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: TreaPlayTitleAnimatorWidgetDowdmow(
              child: TreaImageDhwudhiw(name: "miwmomowdmo",width: 236.w,height: 150.h,),
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
            color: "#5CDFB3".toColordwdowfw(),
            border: Border.all(
              width: 1.w,
              color: "#FCFF30".toColordwdowfw(),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TreaTextDwihdw(data: "Find ", size: 14.sp, color: "#FFFFFF",lineColor: "#371401",fontWeight: FontWeight.w900,),
              TreaTextDwihdw(data: "3", size: 14.sp, color: "#FBF210",lineColor: "#371401",fontWeight: FontWeight.w900,),
              TreaTextDwihdw(data: " identical  symbols in same row", size: 14.sp, color: "#FFFFFF",lineColor: "#371401",fontWeight: FontWeight.w900,),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 316.h,
          margin: EdgeInsets.all(16.w),
          child: GetBuilder<TreaSweetCmefnienfC>(
            id: "list",
            builder: (_)=>Scratcher(
              key: treaC.playHepDnwidow.scratcherKey,
              enabled: true,
              brushSize: 40,
              threshold: 40,
              color: Colors.transparent,
              image: Image.asset('assets/images_treasure124/dmiwmdowm.webp',fit: BoxFit.fill,),
              onThreshold: (){
                treaC.playHepDnwidow.playEnd();
              },
              onScratchUpdate: (details){

              },
              onScratchStart: (){
                treaC.playHepDnwidow.playStart();
              },
              child: Row(
                children: [
                  Expanded(
                    child: MasonryGridView.count(
                      padding: const EdgeInsets.all(0),
                      itemCount: treaC.playHepDnwidow.rewardList.length,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 10.w,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>_playItemWidget(treaC.playHepDnwidow.rewardList[index]),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  SizedBox(
                    width: 62.w,
                    height: 316.h,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                        itemCount: treaC.rewardList.length,
                        itemBuilder: (context,index)=>_playRewardItemWidget(index),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  _playItemWidget(TreaRewardItemBeanDwod bean)=>Stack(
    children: [
      TreaImageDhwudhiw(name: "nciwndiw",width: double.infinity,height: 67.7.h,),
      TreaBreathWidgetCjeidfjoe(
        start: bean.win||bean.isKey,
        child: SizedBox(
          width: double.infinity,
          height: 67.7.h,
          child: _playIconWidget(bean),
        ),
      )
    ],
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
      alignment: Alignment.center,
      child: TreaImageDhwudhiw(name: bean.content,width: 50.w,height: 50.h,),
    );
  }

  _playRewardItemWidget(int index)=>Container(
    width: 86.w,
    height: 67.7.h,
    margin: EdgeInsets.only(top: index==0?0:15.h),
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "nciwndiw",width: double.infinity,height: 67.7.h,),
        Align(
          alignment: Alignment.topCenter,
          child: TreaImageDhwudhiw(name: "icon_money",width: 48.w,height: 48.h,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h),
            child: TreaTextDwihdw(data: "\$${treaC.rewardList[index]}", size: 15.sp, color: "#3A3F48",fontWeight: FontWeight.w900,),
          ),
        ),
      ],
    ),
  );
}