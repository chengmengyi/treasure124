import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_step_omsmwo.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_new_user_guide1_view.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaGuideHepDwidmow{
  static final TreaGuideHepDwidmow _dwidmow=TreaGuideHepDwidmow();
  static TreaGuideHepDwidmow get instance => _dwidmow;
  OverlayEntry? _overlayEntry;

  checkShowNewUserGuide(BuildContext context,GlobalKey lucky77GlobalKey){
    switch(bNewUserGuideStep.getData()){
      case TreaGuideStepOmsmwo.step1GuideLucky77:
        _showStep1GuideLucky77(context,lucky77GlobalKey);
        break;
    }
  }

  _showStep1GuideLucky77(BuildContext context,GlobalKey lucky77GlobalKey){
    var renderBox = lucky77GlobalKey.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var size = renderBox.size;
    showOverlay(
      context: context,
      widget: TreaNewUserGuide1View(
        offset: offset,
        size: size,
        clickCallback: (){
          hideOverlay();
          bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.step2GuideAutoGua);
          TreaRouDwjidw.toJdeidedelde(routerName: TreaBbbbRoulistJfoejfo.lucky77);
        },
      ),
    );
  }

  bool checkShowAutoGuaGuide()=>bNewUserGuideStep.getData()==TreaGuideStepOmsmwo.step2GuideAutoGua;

  setNewUserGuideStep3(){
    bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.step3GuideNoDoubleBtn);
  }

  bool checkShowDoubleBtn()=>bNewUserGuideStep.getData()!=TreaGuideStepOmsmwo.step3GuideNoDoubleBtn;

  setNewUserGuideStep4(){
    if(checkShowDoubleBtn()){
      return;
    }
    bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.step4ShowMoneyGuide);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showTopMoneyGuide);
  }

  bool checkShowTopMoneyGuide()=>bNewUserGuideStep.getData()==TreaGuideStepOmsmwo.step4ShowMoneyGuide;

  completedNewUserGuide(){
    bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.completed);
  }

  setTodayOpenAppTimer(){
    bLastOpenAppTimer.saveData(getTodayTime());
  }

  bool showHomeBoxFinger()=>bLastOpenAppTimer.getData()!=getTodayTime();

  showOverlay({
    required BuildContext context,
    required Widget widget,
  }){
    _overlayEntry=OverlayEntry(builder: (_)=>widget);
    Overlay.of(context).insert(_overlayEntry!);
  }

  hideOverlay(){
    _overlayEntry?.remove();
    _overlayEntry=null;
  }
}