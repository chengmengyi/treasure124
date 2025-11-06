import 'package:treadwkd_bbbase/hep/trea_applife_hep_dwodmow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaOpenNotificationDialogDniwdowC extends TreaFaC{

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point:TreaPointEnumDjwidjo.noti_second_pop);
  }

  clickOpen(){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point:TreaPointEnumDjwidjo.noti_second_r);
    TreaRouDwjidw.backdwhudie();
    TreaApplifeHepDwodmow.instance.toOpenNotification=true;
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  clickClose(){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point:TreaPointEnumDjwidjo.noti_second_c);
    TreaRouDwjidw.backdwhudie();
  }
}