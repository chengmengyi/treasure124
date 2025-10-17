
import 'treadwkd_bbbb_platform_interface.dart';

class TreadwkdBbbb {
  Future<String?> getPlatformVersion() {
    return TreadwkdBbbbPlatform.instance.getPlatformVersion();
  }
}
