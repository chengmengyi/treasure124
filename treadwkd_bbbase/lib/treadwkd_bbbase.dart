
import 'treadwkd_bbbase_platform_interface.dart';

class TreadwkdBbbase {
  Future<String?> getPlatformVersion() {
    return TreadwkdBbbasePlatform.instance.getPlatformVersion();
  }
}
