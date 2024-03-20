import 'package:flutter_test/flutter_test.dart';
import 'package:csurface/csurface.dart';
import 'package:csurface/csurface_platform_interface.dart';
import 'package:csurface/csurface_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsurfacePlatform
    with MockPlatformInterfaceMixin
    implements CsurfacePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsurfacePlatform initialPlatform = CsurfacePlatform.instance;

  test('$MethodChannelCsurface is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCsurface>());
  });

  test('getPlatformVersion', () async {
    Csurface csurfacePlugin = Csurface();
    MockCsurfacePlatform fakePlatform = MockCsurfacePlatform();
    CsurfacePlatform.instance = fakePlatform;

    expect(await csurfacePlugin.getPlatformVersion(), '42');
  });
}
