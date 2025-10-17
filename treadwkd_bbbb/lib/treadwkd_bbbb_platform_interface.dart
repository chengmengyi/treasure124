import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'treadwkd_bbbb_method_channel.dart';

abstract class TreadwkdBbbbPlatform extends PlatformInterface {
  /// Constructs a TreadwkdBbbbPlatform.
  TreadwkdBbbbPlatform() : super(token: _token);

  static final Object _token = Object();

  static TreadwkdBbbbPlatform _instance = MethodChannelTreadwkdBbbb();

  /// The default instance of [TreadwkdBbbbPlatform] to use.
  ///
  /// Defaults to [MethodChannelTreadwkdBbbb].
  static TreadwkdBbbbPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TreadwkdBbbbPlatform] when
  /// they register themselves.
  static set instance(TreadwkdBbbbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
