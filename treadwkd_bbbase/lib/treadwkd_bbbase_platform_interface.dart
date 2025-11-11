import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'treadwkd_bbbase_method_channel.dart';

abstract class TreadwkdBbbasePlatform extends PlatformInterface {
  /// Constructs a TreadwkdBbbasePlatform.
  TreadwkdBbbasePlatform() : super(token: _token);

  static final Object _token = Object();

  static TreadwkdBbbasePlatform _instance = MethodChannelTreadwkdBbbase();

  /// The default instance of [TreadwkdBbbasePlatform] to use.
  ///
  /// Defaults to [MethodChannelTreadwkdBbbase].
  static TreadwkdBbbasePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TreadwkdBbbasePlatform] when
  /// they register themselves.
  static set instance(TreadwkdBbbasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> treaOpen() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> intentTo(String url) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
