import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
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
  TreaFirebaseHepNievnie.instance.init();
  await TreaPlayTypeHepFjwidjo.instance.initPlayType();
  await TreaBoxHepWhidowmd.instance.initTodayNum();
  TreaValueHepJomeoc.instance.init();
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