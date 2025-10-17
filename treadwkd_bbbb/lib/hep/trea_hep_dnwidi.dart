import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';

class TreaHepDnwidi{
  static String getRouterNameByType(String type){
    switch(type){
      case TreaCardType.lucky77: return TreaBbbbRoulistJfoejfo.lucky77;
      case TreaCardType.wealth: return TreaBbbbRoulistJfoejfo.wealth;
      case TreaCardType.kitten: return TreaBbbbRoulistJfoejfo.kitten;
      case TreaCardType.magic: return TreaBbbbRoulistJfoejfo.magic;
      case TreaCardType.sweet: return TreaBbbbRoulistJfoejfo.sweet;
      case TreaCardType.number: return TreaBbbbRoulistJfoejfo.number;
      default: return "";
    }
  }
}
