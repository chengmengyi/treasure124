import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbb/ui/page/trea_home_dniewdo/trea_home_dniewdo.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_kitten_dwidwo/trea_kitten_dwidwo.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_lucky_77_dwkdjow/trea_lucky_77_dwkdjow.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_magic_widjwom/trea_magic_widjwom.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_number_dnwidnow/trea_number_dnwidnow.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_sweet_cmefnienf/trea_sweet_cmefnienf.dart';
import 'package:treadwkd_bbbb/ui/page/trea_play/trea_wealth_dmwidm/trea_wealth_dmwidm.dart';

class TreaBbbbRoulistJfoejfo{
  static const String home="/bbbb/home";
  static const String lucky77="/bbbb/lucky77";
  static const String wealth="/bbbb/wealth";
  static const String kitten="/bbbb/kitten";
  static const String magic="/bbbb/magic";
  static const String sweet="/bbbb/sweet";
  static const String number="/bbbb/number";
}


var treaBBBBRouListdniwhediw=[
  GetPage(
      name: TreaBbbbRoulistJfoejfo.home,
      page: ()=> TreaHomeDniewdo(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.lucky77,
      page: ()=> TreaLucky77Dwkdjow(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.wealth,
      page: ()=> TreaWealthDmwidm(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.kitten,
      page: ()=> TreaKittenDwidwo(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.magic,
      page: ()=> TreaMagicWidjwom(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.sweet,
      page: ()=> TreaSweetCmefnienf(),
      transition: Transition.fadeIn
  ),
  GetPage(
      name: TreaBbbbRoulistJfoejfo.number,
      page: ()=> TreaNumberDnwidnow(),
      transition: Transition.fadeIn
  ),
];