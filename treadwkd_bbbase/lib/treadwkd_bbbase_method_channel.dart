import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'treadwkd_bbbase_platform_interface.dart';

/// An implementation of [TreadwkdBbbasePlatform] that uses method channels.
class MethodChannelTreadwkdBbbase extends TreadwkdBbbasePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('treadwkd_bbbase');

  @override
  Future<void> treaOpen() async {
    await methodChannel.invokeMethod<String>('treaOpen');
  }
}
