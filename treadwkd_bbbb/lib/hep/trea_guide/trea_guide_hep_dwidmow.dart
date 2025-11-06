import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_step_omsmwo.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_new_user_guide1_view.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_new_user_guide2_view.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_new_user_guide4_view.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_old_user_guide_view.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_open_notification_dialog_dniwdow/trea_open_notification_dialog_dniwdow.dart';

class TreaGuideHepDwidmow{
  static final TreaGuideHepDwidmow _dwidmow=TreaGuideHepDwidmow();
  static TreaGuideHepDwidmow get instance => _dwidmow;
  OverlayEntry? _overlayEntry;

  checkShowNewUserGuide(BuildContext context,GlobalKey lucky77GlobalKey,GlobalKey homeBoxGlobalKey){
    switch(bNewUserGuideStep.getData()){
      case TreaGuideStepOmsmwo.step1GuideLucky77:
        _showStep1GuideLucky77(context,lucky77GlobalKey);
        break;
      case TreaGuideStepOmsmwo.completed:
        _checkShowOldUserGuide(context, homeBoxGlobalKey);
        break;
    }
  }

  _checkShowOldUserGuide(BuildContext context,GlobalKey homeBoxGlobalKey){
    if(bLastOldUserTimer.getData()==getTodayTime()){
      return;
    }
    var renderBox = homeBoxGlobalKey.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    bLastOldUserTimer.saveData(getTodayTime());
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.old_user_pop);
    showOverlay(
      context: context,
      widget: TreaOldUserGuideView(
        offset: offset,
        clickCallback: (){
          hideOverlay();
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.old_user_pop_c);
          TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.clickBoxGuide);
        },
      ),
    );
  }

  _showStep1GuideLucky77(BuildContext context,GlobalKey lucky77GlobalKey){
    var renderBox = lucky77GlobalKey.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    var size = renderBox.size;
    uploadUserGuideShowTbaPoint("pop1");
    completedNewUserGuide();
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

  showStep2GuideView(BuildContext context,GlobalKey globalKey){
    var renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    uploadUserGuideShowTbaPoint("pop2");
    showOverlay(
      context: context,
      widget: TreaNewUserGuide2View(
        offset: offset,
        size: size,
        clickCallback: (){
          hideOverlay();
          bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.step3GuideNoDoubleBtn);
          TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.newUserGuideStep2AutoPlay);
        },
      ),
    );
  }

  bool checkIsStep3()=>bNewUserGuideStep.getData()==TreaGuideStepOmsmwo.step3GuideNoDoubleBtn;

  setNewUserGuideStep4(){
    if(!checkIsStep3()){
      return;
    }
    uploadUserGuideShowTbaPoint("pop4");
    bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.step4ShowMoneyGuide);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.newUserGuideStep4MoneyFinger);
  }

  showStep4GuideView(BuildContext context,GlobalKey? globalKey){
    if(null==globalKey){
      return;
    }
    var renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    uploadUserGuideShowTbaPoint("pop4");
    showOverlay(
      context: context,
      widget: TreaNewUserGuide4View(
        offset: offset,
        clickCallback: (){
          hideOverlay();
          bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.completed);
          TreaRouDwjidw.toJdeidedelde(routerName: TreaBbbbRoulistJfoejfo.cash);
          completedNewUserGuide();
          checkShowOpenNotificationDialog();
        },
      ),
    );
  }


  completedNewUserGuide(){
    bNewUserGuideStep.saveData(TreaGuideStepOmsmwo.completed);
  }

  setTodayOpenAppTimer(){
    bLastOpenAppTimer.saveData(getTodayTime());
  }

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

  uploadUserGuideShowTbaPoint(String step){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.newuser_guide,params: {"pop_step":step});
  }

  checkShowOpenNotificationDialog()async{
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      TreaRouDwjidw.showDdjwidjow(child: TreaOpenNotificationDialogDniwdow());
    }
  }
}