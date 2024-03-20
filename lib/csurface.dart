
import 'csurface_platform_interface.dart';

class Csurface {
  Future<String?> getPlatformVersion() {
    return CsurfacePlatform.instance.getPlatformVersion();
  }
}
