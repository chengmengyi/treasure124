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
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_number_dnwidnow/trea_number_dnwidnow_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_card_base_widget_fjwidjiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_play_title_animator_widget_dowdmow.dart';

class TreaNumberDnwidnow extends TreaFaP<TreaNumberDnwidnowC>{
  @override
  TreaNumberDnwidnowC cccDiheiwidow() => TreaNumberDnwidnowC();

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
        TreaImageDhwudhiw(name: "momomewdwd",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: TreaPlayTitleAnimatorWidgetDowdmow(
              child: TreaImageDhwudhiw(name: "modmowc",width: 236.w,height: 150.h,),
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
        _winNumWidget(),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: 286.h,
              margin: EdgeInsets.all(16.w),
              child: GetBuilder<TreaNumberDnwidnowC>(
                id: "list",
                builder: (_)=>Scratcher(
                  key: treaC.playHepDnwidow.scratcherKey,
                  enabled: true,
                  brushSize: 40,
                  threshold: 40,
                  color: Colors.transparent,
                  image: Image.asset('assets/images_treasure124/nmidwidmw.webp',fit: BoxFit.fill,),
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
                      TreaImageDhwudhiw(name: "mdniwidwm",width: double.infinity,height: double.infinity,),
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
            Container(
              width: 190.w,
              height: 20.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 6.h),
              decoration: BoxDecoration(
                color: "#193155".toColordwdowfw(),
                borderRadius: BorderRadius.circular(36.w),
                border: Border.all(
                  width: 1.w,
                  color: "#FFE55B".toColordwdowfw(),
                ),
              ),
              child: TreaGradientTextDhwiodw(
                data: "Your Number",
                size: 16.sp,
                fontWeight: FontWeight.w900,
                lineColor: "#000000",
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ["#5AF7FF".toColordwdowfw(),"#0458FF".toColordwdowfw(),],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  _winNumWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 190.w,
        height: 20.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: "#193155".toColordwdowfw(),
          borderRadius: BorderRadius.circular(36.w),
          border: Border.all(
            width: 1.w,
            color: "#FFE55B".toColordwdowfw(),
          ),
        ),
        child: TreaGradientTextDhwiodw(
          data: "Win Number",
          size: 16.sp,
          fontWeight: FontWeight.w900,
          lineColor: "#000000",
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ["#FFF404".toColordwdowfw(),"#E4BE49".toColordwdowfw(),"#FFF404".toColordwdowfw(),],
          ),
        ),
      ),
      SizedBox(height: 8.h,),
      SizedBox(
        height: 55.h,
        child: GetBuilder<TreaNumberDnwidnowC>(
          id: "win_number",
          builder: (_)=>ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: treaC.winNumberList.length,
            itemBuilder: (context,index)=>Container(
              margin: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TreaImageDhwudhiw(name: "mdowomdw",width: 62.w,height: 55.h,),
                  TreaGradientTextDhwiodw(
                    data: "${treaC.winNumberList[index]}",
                    size: 32.sp,
                    fontWeight: FontWeight.bold,
                    lineColor: "#FF9500",
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: ["#FFF130".toColordwdowfw(),"#FF696C".toColordwdowfw()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );

  _playItemWidget(TreaRewardItemBeanDwod bean)=>TreaBreathWidgetCjeidfjoe(
    start: bean.win||bean.isKey,
    child: SizedBox(
      width: double.infinity,
      height: 71.5.h,
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
        margin: EdgeInsets.only(top: 10.h),
        child: TreaGradientTextDhwiodw(
          data: bean.content,
          size: 32.sp,
          fontWeight: FontWeight.bold,
          lineColor: "#FF9500",
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ["#FFF130".toColordwdowfw(),"#FF696C".toColordwdowfw()],
          ),
        ),
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