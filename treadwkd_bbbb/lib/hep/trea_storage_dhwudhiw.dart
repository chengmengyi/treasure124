import 'package:treadwkd_bbbase/hep/trea_ex.dart';

class TreaStorageDhwudhiw{
  static const String bMyMoney="bMyMoney";
  static const String bGuaKaNum="bGuaKaNum";
  static const String bLuckyCardNum="bLuckyCardNum";
  static const String bValueConfig="bValueConfig";
  static const String bWheelNum="bWheelNum";
}

StorageData<double> bMyMoney=StorageData<double>(key: TreaStorageDhwudhiw.bMyMoney, defaultValue: 0.0);

StorageData<int> bGuaKaNum=StorageData<int>(key: TreaStorageDhwudhiw.bGuaKaNum, defaultValue: 0);
StorageData<int> bLuckyCardNum=StorageData<int>(key: TreaStorageDhwudhiw.bLuckyCardNum, defaultValue: 0);
StorageData<int> bWheelNum=StorageData<int>(key: TreaStorageDhwudhiw.bWheelNum, defaultValue: 0);

StorageData<String> bValueConfig=StorageData<String>(key: TreaStorageDhwudhiw.bValueConfig, defaultValue: "");