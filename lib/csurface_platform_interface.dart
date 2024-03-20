import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'csurface_method_channel.dart';

abstract class CsurfacePlatform extends PlatformInterface {
  /// Constructs a CsurfacePlatform.
  CsurfacePlatform() : super(token: _token);

  static final Object _token = Object();

  static CsurfacePlatform _instance = MethodChannelCsurface();

  /// The default instance of [CsurfacePlatform] to use.
  ///
  /// Defaults to [MethodChannelCsurface].
  static CsurfacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsurfacePlatform] when
  /// they register themselves.
  static set instance(CsurfacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> createTexture(Map<String,dynamic> args) {
    throw UnimplementedError('createTexture() has not been implemented.');

  }
}
