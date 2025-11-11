import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_auto_gua_animator_djwidjomw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_box_widget_djwidjow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_bubble_widget_djwiodw.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_key_animator_widget_dmwidow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_lucky_card_animator_widget_diwdjiwm.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_money_animator_widget.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_top_widget_djheidow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_wheel_icon_widget_djwidjiw.dart';

class TreaCardBaseWidgetFjwidjiw extends TreaFaW{
  TreaPlayHepDnwidow playHepDnwidow;
  Widget child;
  TreaCardBaseWidgetFjwidjiw({
    required this.playHepDnwidow,
    required this.child,
});

  @override
  State<StatefulWidget> createState() => _TreaCardBaseWidgetFjwidjiwState();
}

class _TreaCardBaseWidgetFjwidjiwState extends TreaFaWState<TreaCardBaseWidgetFjwidjiw>{
  var showGuaGuideAnimator=true;
  TreaPlayTypeInfoFhwiedhi? playTypeInfoFhwiedhi;
  GlobalKey topMoneyGlobalKey=GlobalKey();

  @override
  void initState() {
    super.initState();
    _queryPlayNum();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.card_detail_page,params: {"page_from":widget.playHepDnwidow.playType});
  }

  @override
  Widget wwwdwjidwo() => WillPopScope(
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "fkoek",width: double.infinity,height: double.infinity,),
        Column(
          children: [
            TreaTopWidgetDjheidow(
              fromHome: false,
              topMoneyGlobalKey: topMoneyGlobalKey,
              clickClose: (){
                widget.playHepDnwidow.clickClose();
              },
              clickMoneyCallback: (){

              },
            ),
            _luckyCardAndBoxWidget(),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 30.w,right: 30.w),
                  child: Stack(
                    children: [
                      widget.child,
                      Align(
                        alignment: Alignment.topRight,
                        child: Stack(
                          children: [
                            TreaImageDhwudhiw(name: "mcimo",width: 47.w,height: 32.h,),
                            Positioned(
                              top: 8.h,
                              right: 6.w,
                              child: Transform.rotate(
                                angle: 45 * pi / 180,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TreaTextDwihdw(data: "${playTypeInfoFhwiedhi?.currentPro??0}", size: 10.sp, color: "#FFDC16",lineColor: "#000000",),
                                    TreaTextDwihdw(data: "/${playTypeInfoFhwiedhi?.totalPro??0}", size: 10.sp, color: "#FFFFFF",lineColor: "#000000",),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: showGuaGuideAnimator,
                        child: IgnorePointer(
                          child: Container(
                            margin: EdgeInsets.only(top: 200.h),
                            child: TreaAutoGuaAnimatorDjwidjomw(),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 12.h),
            child: Row(
              children: [
                SizedBox(
                  key: widget.playHepDnwidow.wheelIconGlobalKey,
                  child: TreaWheelIconWidgetDjwidjiw(
                    fromHome: false,
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TreaClickDhwidjow(
                        onTap: (){
                          widget.playHepDnwidow.autoPlay();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            TreaImageDhwudhiw(name: "dmiwmow",width: 147.w,height: 40.h,),
                            TreaTextDwihdw(data: "Check Card", size: 20.sp, color: "#FFFFFF",lineColor: "#5E00FF",fontWeight: FontWeight.w900,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _luckyCardWidget(),
              ],
            ),
          ),
        ),
        TreaKeyAnimatorWidgetDmwidow(),
        TreaLuckyCardAnimatorWidgetDiwdjiwm(),
        TreaMoneyAnimatorWidget(),
        TreaBubbleWidgetDjwiodw(),
      ],
    ),
    onWillPop: ()async{
      widget.playHepDnwidow.clickClose();
      return false;
    },
  );

  _luckyCardAndBoxWidget()=>Row(
    children: [
      Spacer(),
      TreaBoxWidgetDjwidjow(),
      SizedBox(width: 20.w,),
    ],
  );

  _luckyCardWidget(){
    // var data = bLuckyCardNum.getData();
    return TreaClickDhwidjow(
      onTap: (){
        showToast("Every 3 scratched cards unlocks 1 Lucky Card!");
      },
      child: SizedBox(
        width: 80.w,
        height: 73.w,
        key: widget.playHepDnwidow.luckyCardIconGlobalKey,
        child: TreaImageDhwudhiw(name: "dowdowm",width: 73.w,height: 73.w,),
        // child: Stack(
        //   children: [
        //     TreaImageDhwudhiw(name: "dowdowm",width: 73.w,height: 73.w,),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Container(
        //         margin: EdgeInsets.only(bottom: 10.h),
        //         child: TreaGradientTextDhwiodw(
        //           data: "lucky card",
        //           size: 13.sp,
        //           lineColor: "#000000",
        //           fontWeight: FontWeight.bold,
        //           gradient: LinearGradient(
        //               begin: Alignment.topCenter,
        //               end: Alignment.bottomCenter,
        //               colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),]
        //           ),
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       top: 12.h,
        //       right: 0,
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           _luckyCardPointItemWidget(data>0),
        //           SizedBox(height: 4.h,),
        //           Container(
        //             margin: EdgeInsets.only(left: 8.w),
        //             child: _luckyCardPointItemWidget(data>1),
        //           ),
        //           SizedBox(height: 4.h,),
        //           _luckyCardPointItemWidget(data>2),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  _luckyCardPointItemWidget(bool show)=>Container(
    width: 8.w,
    height: 8.w,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.w),
      color: "#545454".toColordwdowfw(),
    ),
    child: show?
    Container(
      width: 5.w,
      height: 5.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.w),
        color: "#EEFF00".toColordwdowfw(),
      ),
    ):null,
  );

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateLuckyCardNum:
        setState(() {});
        break;
      case TreaEventCodeDhwdhwi.updateHomeList:
        _queryPlayNum();
        break;
      case TreaEventCodeDhwdhwi.showOrHideAutoGuaAnimator:
        setState(() {
          showGuaGuideAnimator=bean.str=="show";
        });
        break;
      case TreaEventCodeDhwdhwi.newUserGuideStep2AutoPlay:
        widget.playHepDnwidow.autoPlay();
        break;
      case TreaEventCodeDhwdhwi.newUserGuideStep4MoneyFinger:
        TreaGuideHepDwidmow.instance.showStep4GuideView(context, topMoneyGlobalKey);
        break;
    }
  }

  _queryPlayNum()async{
    playTypeInfoFhwiedhi = await TreaPlayTypeHepFjwidjo.instance.queryCardInfoByType(widget.playHepDnwidow.playType);
    setState(() {});
  }
}