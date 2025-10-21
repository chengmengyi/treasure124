import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_sql_dwhidhwo.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_first_has_money_dialog_mwdowm/trea_first_has_money_dialog_mwdowm.dart';

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
  static const String queue="queue";
}

class TreaCashHepCneimdi{
  static final TreaCashHepCneimdi _cashHepCneimdi=TreaCashHepCneimdi();
  static TreaCashHepCneimdi get instance => _cashHepCneimdi;

  createCashTask(String cashType,int cashMoney)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [cashType,cashMoney]);
    if(list.isNotEmpty){
      return;
    }
    var firstWithdrawTask = TreaValueHepJomeoc.instance.getFirstWithdrawTask();
    var bean = TreaCashTaskInfoBeanWiodow(cashType: cashType,cashMoney: cashMoney,taskId: firstWithdrawTask?.id,currentProgress: 0,totalProgress: firstWithdrawTask?.count);
    await database.insert(TreaSqlNamewdhiw.bCashTask, bean.toJson());
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
  }

  Future<TreaCashTaskInfoBeanWiodow?> queryCashTaskInfo(String cashType,int cashMoney)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,where: 'cashType = ? AND cashMoney = ?',whereArgs: [cashType,cashMoney]);
    if(list.isEmpty){
      return null;
    }
    return TreaCashTaskInfoBeanWiodow.fromJson(list.first);
  }

  updateCashTask(String taskType)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bCashTask,);
    if(list.isEmpty){
      return;
    }
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
        }else{
          taskInfoBean.currentProgress=0;
          taskInfoBean.totalProgress=nextWithdrawTask.count;
          taskInfoBean.taskId=nextWithdrawTask.id;
        }
      }
      await database.update(TreaSqlNamewdhiw.bCashTask, taskInfoBean.toJson(),where: ' id = ?',whereArgs: [value["id"]]);
    }
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateCashAmountList);
  }

  updateQueueTask()async{

  }

  showFirstHasMoneyDialog(){
    // if(!bShowFirstHasMoneyDialog.getData()){
    //   return;
    // }
    // bShowFirstHasMoneyDialog.saveData(false);
    TreaRouDwjidw.showDdjwidjow(
      child: TreaFirstHasMoneyDialogMwdowm(
        sureCallback: (String cashType,int cashMoney,String account){
          showGiveMoneyAnimatorDialog(cashType,cashMoney,account);
        },
      ),
    );
  }

  showGiveMoneyAnimatorDialog(String cashType,int cashMoney,String account){
    
  }
}