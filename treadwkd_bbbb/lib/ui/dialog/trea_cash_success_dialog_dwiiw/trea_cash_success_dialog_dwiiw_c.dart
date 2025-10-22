import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';

class TreaCashSuccessDialogDwiiwC extends TreaFaC{

  clickOk(TreaCashTaskInfoBeanWiodow taskInfo)async{
    await TreaCashHepCneimdi.instance.deleteCashTask(taskInfo);
    TreaRouDwjidw.backdwhudie();
  }
}