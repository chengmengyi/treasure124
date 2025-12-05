import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/scratcher/scratcher.dart';
import 'package:treadwkd_bbbase/ui/trea_breath_widget_cjeidfjoe.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_magic_widjwom/trea_magic_widjwom_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_card_base_widget_fjwidjiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_card_animator_widget_djwidjow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_title_animator_widget_dowdmow.dart';

class TreaMagicWidjwom extends TreaFaP<TreaMagicWidjwomC>{
  @override
  TreaMagicWidjwomC cccDiheiwidow() => TreaMagicWidjwomC();

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
        TreaImageDhwudhiw(name: "cmienfie",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: TreaPlayTitleAnimatorWidgetDowdmow(
              child: TreaImageDhwudhiw(name: "dmiwmdocmfr",width: 236.w,height: 150.h,),
            ),
          ),
        ),
        _playWidget(),
      ],
    ),
  );

  _playWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: TreaPlayCardAnimatorWidgetDjwidjow(
      child: Container(
        width: double.infinity,
        height: 316.h,
        margin: EdgeInsets.all(16.w),
        child: GetBuilder<TreaMagicWidjwomC>(
          id: "list",
          builder: (_)=>Scratcher(
            key: treaC.playHepDnwidow.scratcherKey,
            enabled: true,
            brushSize: 40,
            threshold: 40,
            color: Colors.transparent,
            image: Image.asset('assets/images_treasure124/cniefnhre.webp',fit: BoxFit.fill,),
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
                  child: Stack(
                    children: [
                      TreaImageDhwudhiw(name: "ceovniefe",width: double.infinity,height: 316.h,),
                      MasonryGridView.count(
                        padding: const EdgeInsets.all(0),
                        itemCount: treaC.playHepDnwidow.rewardList.length,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)=>_playItemWidget(treaC.playHepDnwidow.rewardList[index]),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w,),
                Stack(
                  children: [
                    TreaImageDhwudhiw(name: "cmeomowd",width: 86.w,height: 316.h,),
                    SizedBox(
                      width: 86.w,
                      height: 316.h,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          itemCount: treaC.rewardList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index)=>SizedBox(
                            width: 86.w,
                            height: 79.h,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: TreaImageDhwudhiw(name: "icon_money",width: 60.w,height: 60.h,),
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  _playItemWidget(TreaRewardItemBeanDwod bean)=>Stack(
    children: [
      TreaBreathWidgetCjeidfjoe(
        start: bean.win||bean.isKey,
        child: SizedBox(
          width: double.infinity,
          height: 79.h,
          child: _playIconWidget(bean),
        ),
      ),
      Container(
        width: double.infinity,
        height: 79.h,
        color: bean.win||bean.isKey?null:Colors.black.withOpacity(0.4),
      ),
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
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          TreaImageDhwudhiw(name: bean.bg,width: 54.w,height: 54.h,),
          Positioned(
            top: 2.h,
            left: 12.w,
            child: TreaTextDwihdw(data: bean.content, size: 14.sp, color: bean.bg.contains("heitao")||bean.bg.contains("meihua")?"#000001":"#DB0E35",fontWeight: FontWeight.w900,),
          ),
        ],
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