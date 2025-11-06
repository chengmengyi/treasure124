
import 'treadwkd_bbbase_platform_interface.dart';

class TreadwkdBbbase {
  static final TreadwkdBbbase _bbbase=TreadwkdBbbase();
  static TreadwkdBbbase get instance => _bbbase;

  treaOpen()async{
    TreadwkdBbbasePlatform.instance.treaOpen();
  }
}
