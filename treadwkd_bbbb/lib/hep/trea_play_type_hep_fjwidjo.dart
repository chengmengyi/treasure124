import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_sql_dwhidhwo.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_level_hep_dwifnowe.dart';

class TreaCardType{
  static const String lucky77="lucky77";
  static const String wealth="wealth";
  static const String kitten="kitten";
  static const String magic="magic";
  static const String sweet="sweet";
  static const String number="number";
}

class TreaPlayTypeHepFjwidjo{
  static final TreaPlayTypeHepFjwidjo _fjwidjo=TreaPlayTypeHepFjwidjo();
  static TreaPlayTypeHepFjwidjo get instance => _fjwidjo;

  initPlayType()async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo);
    if(list.isNotEmpty){
      return;
    }
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.lucky77,currentPro: 10,totalPro: 10,unlock: 1).toJson());
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.wealth,currentPro: 10,totalPro: 10,unlock: 0).toJson());
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.kitten,currentPro: 10,totalPro: 10,unlock: 0).toJson());
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.magic,currentPro: 10,totalPro: 10,unlock: 0).toJson());
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.sweet,currentPro: 10,totalPro: 10,unlock: 0).toJson());
    await database.insert(TreaSqlNamewdhiw.bPlayTypeInfo, TreaPlayTypeInfoFhwiedhi(playType: TreaCardType.number,currentPro: 10,totalPro: 10,unlock: 0).toJson());
  }

  Future<List<TreaPlayTypeInfoFhwiedhi>>  getPlayTypeList()async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo);
    if(list.isEmpty){
      return [];
    }
    List<TreaPlayTypeInfoFhwiedhi> result=[];
    for (var value in list) {
      result.add(TreaPlayTypeInfoFhwiedhi.fromJson(value));
    }
    return result;
  }

  updatePlayNumByType(String cardType,int addNum)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo,where: 'playType = ?',whereArgs: [cardType]);
    if(list.isEmpty){
      return;
    }
    var bean = TreaPlayTypeInfoFhwiedhi.fromJson(list.first);
    bean.currentPro=(bean.currentPro??0)+addNum;
    if((bean.currentPro??0)<0){
      bean.currentPro=0;
    }
    if((bean.currentPro??0)>(bean.totalPro??0)){
      bean.currentPro=bean.totalPro;
    }
    await database.update(TreaSqlNamewdhiw.bPlayTypeInfo, bean.toJson(),where: 'id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateHomeList);
  }

  Future<TreaPlayTypeInfoFhwiedhi?> queryCardInfoByType(String cardType)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo,where: 'playType = ?',whereArgs: [cardType]);
    if(list.isEmpty){
      return null;
    }
    return TreaPlayTypeInfoFhwiedhi.fromJson(list.first);
  }

  addAllPlayCardNum()async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo);
    if(list.isEmpty){
      return [];
    }
    for (var value in list) {
      var infoFhwiedhi = TreaPlayTypeInfoFhwiedhi.fromJson(value);
      if((infoFhwiedhi.currentPro??0)<(infoFhwiedhi.totalPro??0)){
        infoFhwiedhi.currentPro=(infoFhwiedhi.currentPro??0)+1;
        await database.update(TreaSqlNamewdhiw.bPlayTypeInfo, infoFhwiedhi.toJson(),where: 'id = ?',whereArgs: [value["id"]]);
      }
    }
  }

  checkUnlockCardByLevel()async{
    if(!TreaLevelHepDwifnowe.instance.checkUpLevel()){
      return;
    }
    var cardType = _getCardTypeByLevel();
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo,where: 'playType = ?',whereArgs: [cardType]);
    if(list.isEmpty){
      return;
    }
    var bean = TreaPlayTypeInfoFhwiedhi.fromJson(list.first);
    if(bean.unlock==1){
      return;
    }
    bean.unlock=1;
    await database.update(TreaSqlNamewdhiw.bPlayTypeInfo, bean.toJson(),where: 'id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateHomeList);
  }

  unlockCardByPlayType(String? playType)async{
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bPlayTypeInfo,where: 'playType = ?',whereArgs: [playType]);
    if(list.isEmpty){
      return;
    }
    var bean = TreaPlayTypeInfoFhwiedhi.fromJson(list.first);
    bean.unlock=1;
    await database.update(TreaSqlNamewdhiw.bPlayTypeInfo, bean.toJson(),where: 'id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateHomeList);
  }

  String _getCardTypeByLevel(){
    var handleLevel = TreaLevelHepDwifnowe.instance.handleLevel();
    switch(handleLevel.level){
      case 1: return TreaCardType.lucky77;
      case 2: return TreaCardType.wealth;
      case 3: return TreaCardType.kitten;
      case 4: return TreaCardType.magic;
      case 5: return TreaCardType.sweet;
      case 6: return TreaCardType.number;
      default: return TreaCardType.lucky77;
    }
  }
}