import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_applife_hep_dwodmow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/hep/trea_user_hep_dwijdiwm.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';
import 'package:treadwkd_bbbase/ui/page/trea_web_dwiodmw/trea_common_router_name_dwjidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_box_hep_whidowmd.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treasure124/trea_common/trea_roulsit_dhwuhdiw.dart';
import 'package:spine_flutter/spine_flutter.dart';

void main() async{
  await didowjo();
  runApp(const MyApp());
}

didowjo()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      )
  );
  await initSpineFlutter();
  await GetStorage.init();

  //b
  TreaApplifeHepDwodmow.instance.initAppLife();
  TreaFeng.instance.inTreafeiimwoitNumberUnit(apiKey: decrypt(TreaLocalDjwidj.smKeyEn, 124));
  TreaFirebaseHepNievnie.instance.init();
  TreaUserHepDwijdiwm.instance.initCheckejije();
  await TreaPlayTypeHepFjwidjo.instance.initPlayType();
  await TreaBoxHepWhidowmd.instance.initTodayNum();
  TreaValueHepJomeoc.instance.init();

  TreaTttIwjodwm.instance.installEventdwjodw();
  TreaAdHepNwidiow.instance.initAdwieji();
  TreaVoiceHepDwidiwn.instance.initVoicehidjow();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (c,child)=>GetMaterialApp(
        title: 'ScratchLucky Treasure',
        enableLog: true,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: TreaCommonRouterNameDwjidjow.launch,
        debugShowCheckedModeBanner: false,
        getPages: treaCommonRouListdniwhediw+treaBBBBRouListdniwhediw,
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}