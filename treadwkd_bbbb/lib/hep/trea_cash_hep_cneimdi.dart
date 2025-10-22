import 'package:sqflite_common/sqlite_api.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_sql_dwhidhwo.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_apply_animator_dialog_djwijow/trea_apply_animator_dialog_djwijow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_success_dialog_dwiiw/trea_cash_success_dialog_dwiiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_task_dialog_dwidijw/trea_cash_task_dialog_dwidijw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_completed_task_dialog_nwidowm/trea_completed_task_dialog_nwidowm.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_donot_worry_dialog_cwidjoiw/trea_donot_worry_dialog_cwidjoiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_first_has_money_dialog_mwdowm/trea_first_has_money_dialog_mwdowm.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_give_money_animator_dialog_dmwodmow/trea_give_money_animator_dialog_dmwodmow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_input_account_dialog_dmwidow/trea_input_account_dialog_dmwidow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_rank_dialog_dwiehiw/trea_rank_dialog_dwiehiw.dart';

class TreaCashType{
  static const String paypal="paypal";
  static const String cashapp="cashapp";
  static const String pagbank="pagbank";
  static const String pix="pix";
}

class TreaTaskType{
  static const String card="card";
  static const String wheel="wheel";
  static const String lucky="lucky";
  static const String ad="ad";
}

class TreaCashHepCneimdi{
  static final TreaCashHepCneimdi _cashHepCneimdi=TreaCashHepCneimdi();
  static TreaCashHepCneimdi get instance => _cashHepCneimdi;

  Future<TreaCashTaskInfoBeanWiodow?> createCashTask(String cashType,int cashMoney, String account)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [cashType,cashMoney]);
    if(list.isNotEmpty){
      return TreaCashTaskInfoBeanWiodow.fromJson(list.first);
    }
    var firstWithdrawTask = TreaValueHepJomeoc.instance.getFirstWithdrawTask();
    var bean = TreaCashTaskInfoBeanWiodow(cashType: cashType,cashMoney: cashMoney,taskId: firstWithdrawTask?.id,currentProgress: 0,totalProgress: firstWithdrawTask?.count,isRank: 0);
    await database.insert(TreaSqlNamewdhiw.bCashTask, bean.toJson());
    _saveCashAccount(database,cashType,account);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
    return bean;
  }

  _saveCashAccount(Database database,String cashType,String cashAccount)async{
    var list = await database.query(TreaSqlNamewdhiw.bCashAccountInfo,where: 'cashType = ? ',whereArgs: [cashType]);
    if(list.isNotEmpty){
      return;
    }
    database.insert(TreaSqlNamewdhiw.bCashAccountInfo, {"cashType":cashType,"cashAccount":cashAccount});
  }

  Future<String> queryCashAccount(String? cashType)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashAccountInfo,where: 'cashType = ? ',whereArgs: [cashType]);
    if(list.isEmpty){
      return "";
    }
    return list.first["cashAccount"] as String;
  }

  Future<TreaCashTaskInfoBeanWiodow?> queryCashTaskInfo(String cashType,int cashMoney)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [cashType,cashMoney]);
    if(list.isEmpty){
      return null;
    }
    return TreaCashTaskInfoBeanWiodow.fromJson(list.first);
  }

  Future<TreaCashTaskInfoBeanWiodow?> updateCashTask(String taskType)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'isRank = ? ',whereArgs: [0]);
    if(list.isEmpty){
      return null;
    }
    TreaCashTaskInfoBeanWiodow? completedTaskInfo;
    for (var value in list) {
      var taskInfoBean = TreaCashTaskInfoBeanWiodow.fromJson(value);
      var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(taskInfoBean.taskId);
      if(withdrawTask?.type!=taskType){
        continue;
      }
      taskInfoBean.currentProgress=(taskInfoBean.currentProgress??0)+1;
      if(((taskInfoBean.currentProgress??0))>=(taskInfoBean.totalProgress??0)){
        var nextWithdrawTask = TreaValueHepJomeoc.instance.getNextWithdrawTaskById(taskInfoBean.taskId);
        //说明全部任务都完成了
        if(null==nextWithdrawTask){
          taskInfoBean.currentProgress=taskInfoBean.totalProgress;
          completedTaskInfo ??= taskInfoBean;
        }else{
          taskInfoBean.currentProgress=0;
          taskInfoBean.totalProgress=nextWithdrawTask.count;
          taskInfoBean.taskId=nextWithdrawTask.id;
        }
      }
      await database.update(TreaSqlNamewdhiw.bCashTask, taskInfoBean.toJson(),where: ' id = ?',whereArgs: [value["id"]]);
    }
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
    return completedTaskInfo;
  }

  Future<TreaCashTaskInfoBeanWiodow?> changeTaskToRank(TreaCashTaskInfoBeanWiodow taskInfo)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [taskInfo.cashType,taskInfo.cashMoney]);
    if(list.isEmpty){
      return null;
    }
    var bean = TreaCashTaskInfoBeanWiodow.fromJson(list.first);
    bean.isRank=1;
    bean.currentProgress=TreaValueHepJomeoc.instance.getCurrentRank().intCurrent;
    bean.totalProgress=TreaValueHepJomeoc.instance.getAllRank().intAll;
    await database.update(TreaSqlNamewdhiw.bCashTask, bean.toJson(),where: ' id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
    return bean;
  }

  deleteCashTask(TreaCashTaskInfoBeanWiodow taskInfo)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [taskInfo.cashType,taskInfo.cashMoney]);
    if(list.isEmpty){
      return;
    }
    await database.delete(TreaSqlNamewdhiw.bCashTask,where: ' id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
  }

  Future<TreaCashTaskInfoBeanWiodow> updateRankProgress(TreaCashTaskInfoBeanWiodow bean)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ? AND isRank = ?',whereArgs: [bean.cashType,bean.cashMoney,1]);
    if(list.isEmpty){
      return bean;
    }
    var currentReduceNum = TreaValueHepJomeoc.instance.getCurrentReduceNum();
    var allReduceNum = TreaValueHepJomeoc.instance.getAllReduceNum();
    var cashTaskInfo = TreaCashTaskInfoBeanWiodow.fromJson(list.first);
    cashTaskInfo.currentProgress=(cashTaskInfo.currentProgress??0)-currentReduceNum;
    cashTaskInfo.totalProgress=(cashTaskInfo.totalProgress??0)-allReduceNum;
    if((cashTaskInfo.currentProgress??0)<=0){
      cashTaskInfo.currentProgress=1;
    }
    if((cashTaskInfo.totalProgress??0)<=0){
      cashTaskInfo.totalProgress=1;
    }
    await database.update(TreaSqlNamewdhiw.bCashTask, cashTaskInfo.toJson(),where: '"id" = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
    return cashTaskInfo;
  }

  showInputAccountDialog(String cashType,int cashMoney){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaInputAccountDialogDmwidow(
        cashType: cashType,
        money: cashMoney,
        sureCallback: (String cashType,int cashMoney,String account){
          _showGiveMoneyAnimatorDialog(cashType,cashMoney,account);
        },
      ),
    );
  }

  showFirstHasMoneyDialog(){
    if(!bShowFirstHasMoneyDialog.getData()){
      return;
    }
    bShowFirstHasMoneyDialog.saveData(false);
    TreaRouDwjidw.showDdjwidjow(
      child: TreaFirstHasMoneyDialogMwdowm(
        sureCallback: (String cashType,int cashMoney,String account){
          _showGiveMoneyAnimatorDialog(cashType,cashMoney,account);
        },
      ),
    );
  }

  _showGiveMoneyAnimatorDialog(String cashType,int cashMoney,String account){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaGiveMoneyAnimatorDialogDmwodmow(
        cashType: cashType,
        cashMoney: cashMoney,
        dismissCallback: (){
          _showDonotWorryDialog(cashType,cashMoney,account);
        },
      ),
    );
  }

  _showDonotWorryDialog(String cashType,int cashMoney,String account){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaDonotWorryDialogCwidjoiw(
        dismissCallback: ()async{
          var taskInfoBeanWiodow = await createCashTask(cashType, cashMoney,account);
          TreaUserInfoHepDwidhiw.instance.updateMyMoney((-cashMoney).toDouble());
          showCashTaskDialog(taskInfoBeanWiodow);
        },
      ),
    );
  }

  showCashTaskDialog(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaCashTaskDialogDwidijw(
        cashTaskInfo: cashTaskInfo,
        clickGoCallback: (){

        },
      ),
    );
  }

  showCompletedTaskDialog({
    required TreaCashTaskInfoBeanWiodow taskInfo,
    Function()? callback,
}){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaCompletedTaskDialogNwidowm(
        dismissCallback: (){
          TreaRouDwjidw.showDdjwidjow(
            child: TreaApplyAnimatorDialogDjwijow(
              dismissCallback: ()async{
                var taskInfoBeanWiodow = await changeTaskToRank(taskInfo);
                showRankDialog(taskInfoBeanWiodow,callback: callback);
              },
            ),
          );
        },
      ),
    );
  }

  showRankDialog(TreaCashTaskInfoBeanWiodow? taskInfo,{Function()? callback}){
    if(null==taskInfo){
      callback?.call();
      return;
    }
    if((taskInfo.currentProgress??0)<=0){
      TreaRouDwjidw.showDdjwidjow(child: TreaCashSuccessDialogDwiiw(taskInfo: taskInfo,));
      return;
    }
    TreaRouDwjidw.showDdjwidjow(
      child: TreaRankDialogDwiehiw(
        taskInfo: taskInfo,
        dismissCallback: (bool completed){
          callback?.call();
          if(completed) {
            TreaRouDwjidw.showDdjwidjow(child: TreaCashSuccessDialogDwiiw(taskInfo: taskInfo,));
          }
        },
      ),
    );
  }

  bool checkCompletedCashTask(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    if(null==cashTaskInfo){
      return false;
    }
    var currentProgress = cashTaskInfo.currentProgress??0;
    var totalProgress = cashTaskInfo.totalProgress??0;
    if(cashTaskInfo.isRank==1){
      return currentProgress<=1;
    }
    var nextWithdrawTask = TreaValueHepJomeoc.instance.getNextWithdrawTaskById(cashTaskInfo.taskId);
    return null==nextWithdrawTask&&currentProgress>=totalProgress;
  }
}