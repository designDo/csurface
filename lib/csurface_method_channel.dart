import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'csurface_platform_interface.dart';

/// An implementation of [CsurfacePlatform] that uses method channels.
class MethodChannelCsurface extends CsurfacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('csurface');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int> createTexture(Map<String, dynamic> args) async   {
    final id = await methodChannel.invokeMethod('createTexture',args);
    return id;
  }
}
