import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaBubbleWidgetDjwiodw extends TreaFaW{
  @override
  State<StatefulWidget> createState() => _TreaBubbleWidgetDjwiodwState();
}

class _TreaBubbleWidgetDjwiodwState extends TreaFaWState<TreaBubbleWidgetDjwiodw>{
  double addNum=TreaValueHepJomeoc.instance.getBubbleReward();
  double maxWidth=375.w,currentX=0.0;
  double maxHeight=812.h,currentY=0.0;
  Timer? _timer;
  bool right=true,down=true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
  }

  @override
  Widget wwwdwjidwo() => LayoutBuilder(
    builder: (c,bc){
      maxWidth=bc.maxWidth-68.w;
      maxHeight=bc.maxHeight-68.h;
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: currentY,
              left: currentX,
              child: TreaClickDhwidjow(
                onTap: (){
                  _clickBubble();
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    TreaImageDhwudhiw(name: "mdowmdowmocw",width: 56.w,height: 60.h,),
                    TreaGradientTextDhwiodw(
                      data: "\$$addNum",
                      size: 15.sp,
                      fontWeight: FontWeight.w900,
                      lineColor: "#D83507",
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: ["#FFD70F".toColordwdowfw(),"#F0A00D".toColordwdowfw(),"#FFD70F".toColordwdowfw(),],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );

  _startTimer(){
    _timer=Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if(right){
        currentX++;
        if(down){
          currentY++;
          if(currentY>=maxHeight){
            down=false;
          }
        }else{
          currentY--;
          if(currentY<=0){
            down=true;
          }
        }
        if(currentX>=maxWidth){
          right=false;
        }
      }else{
        currentX--;
        if(down){
          currentY++;
          if(currentY>=maxHeight){
            down=false;
          }
        }else{
          currentY--;
          if(currentY<=0){
            down=true;
          }
        }
        if(currentX<=0){
          right=true;
        }
      }
      setState(() {});
    });
  }

  _clickBubble(){
    TreaVoiceHepDwidiwn.instance.playSound(SoundType.bubble);
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.reward,
      showAd: TreaValueHepJomeoc.instance.showAd(AdType.reward),
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_cash_rv,
      closeAd: (give){
        if(give){
          TreaUserInfoHepDwidhiw.instance.updateMyMoney(addNum);
        }
        setState(() {
          addNum=TreaValueHepJomeoc.instance.getBubbleReward();
        });
        TreaUserInfoHepDwidhiw.instance.checkShowFirstCashDialog();
      },
    );
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateMoneyNum:
        setState(() {
          addNum=TreaValueHepJomeoc.instance.getBubbleReward();
        });
        break;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer=null;
    super.dispose();
  }
}