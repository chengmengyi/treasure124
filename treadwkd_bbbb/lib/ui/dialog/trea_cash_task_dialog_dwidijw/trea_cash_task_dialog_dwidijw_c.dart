import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaCashTaskDialogDwidijwC extends TreaFaC{
  TreaCashTaskInfoBeanWiodow? cashTaskInfo;
  TreaCashTaskDialogDwidijwC(this.cashTaskInfo);
  @override
  void onInit() {
    super.onInit();
    var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(cashTaskInfo?.taskId);
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_task_pop,params: {"pop_from":withdrawTask?.type});
  }

  String getTaskLeftStr(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(cashTaskInfo?.taskId);
    if(null==withdrawTask){
      return "";
    }
    switch(withdrawTask.type){
      case TreaTaskType.card: return "Scratch  ";
      case TreaTaskType.wheel: return "Play  ";
      case TreaTaskType.lucky: return "Play  ";
      case TreaTaskType.ad: return "Watch  ";
      default: return "";
    }
  }

  String getTaskRightStr(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(cashTaskInfo?.taskId);
    if(null==withdrawTask){
      return "";
    }
    switch(withdrawTask.type){
      case TreaTaskType.card: return " Card";
      case TreaTaskType.wheel: return " Spins";
      case TreaTaskType.lucky: return " luck cards";
      case TreaTaskType.ad: return " Ad Video";
      default: return "";
    }
  }


  double getTaskProgress(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    var currentProgress = cashTaskInfo?.currentProgress??0;
    var totalProgress = cashTaskInfo?.totalProgress??0;
    if(totalProgress==0){
      return 0;
    }
    var d = currentProgress/totalProgress;
    if(d>1){
      return 1.0;
    }else if(d<0){
      return 0.0;
    }else{
      return d;
    }
  }

  clickGo(Function() clickGoCallback){
    var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(cashTaskInfo?.taskId);
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_task_pop_c,params: {"pop_from":withdrawTask?.type});
    TreaRouDwjidw.backdwhudie();
    clickGoCallback.call();
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }
}