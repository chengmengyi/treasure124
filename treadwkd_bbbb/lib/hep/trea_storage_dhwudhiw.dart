import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';

class TreaStorageDhwudhiw{
  static const String bMyMoney="bMyMoney";
  static const String bGuaKaNum="bGuaKaNum";
  static const String bLuckyCardNum="bLuckyCardNum";
  static const String bValueConfig="bValueConfig";
  static const String bWheelNum="bWheelNum";
  static const String bSelectedCashType="bSelectedCashType";
  static const String bOpenEyeSwitch="bOpenEyeSwitch";
}

StorageData<double> bMyMoney=StorageData<double>(key: TreaStorageDhwudhiw.bMyMoney, defaultValue: 0.0);

StorageData<int> bGuaKaNum=StorageData<int>(key: TreaStorageDhwudhiw.bGuaKaNum, defaultValue: 0);
StorageData<int> bLuckyCardNum=StorageData<int>(key: TreaStorageDhwudhiw.bLuckyCardNum, defaultValue: 0);
StorageData<int> bWheelNum=StorageData<int>(key: TreaStorageDhwudhiw.bWheelNum, defaultValue: 0);

StorageData<String> bValueConfig=StorageData<String>(key: TreaStorageDhwudhiw.bValueConfig, defaultValue: "");
StorageData<String> bSelectedCashType=StorageData<String>(key: TreaStorageDhwudhiw.bSelectedCashType, defaultValue: TreaCashType.paypal);

StorageData<bool> bOpenEyeSwitch=StorageData<bool>(key: TreaStorageDhwudhiw.bOpenEyeSwitch, defaultValue: true);