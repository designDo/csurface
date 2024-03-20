
package com.example.csurface;

import android.graphics.SurfaceTexture;
import android.view.Surface;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.view.TextureRegistry;

/** CsurfacePlugin */
public class CsurfacePlugin implements FlutterPlugin, MethodCallHandler {

  private MethodChannel channel;

  private  TextureRegistry textures;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    textures =  flutterPluginBinding.getTextureRegistry();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "csurface");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("createTexture")){
      //创建外部纹理并返回

      SurfaceRender render = new SurfaceRender();
      render.nativeInit();

      TextureRegistry.SurfaceTextureEntry entry = textures.createSurfaceTexture();
      SurfaceTexture surfaceTexture = entry.surfaceTexture();


      Map<String,Object> args = call.arguments();
      int width = ((Double)call.argument("width")).intValue();
      int height = ((Double)call.argument("height")).intValue();
      surfaceTexture.setDefaultBufferSize(width,height);


      Surface surface = new Surface(surfaceTexture);

      render.onSurfaceCreated(surface);
      render.onSurfaceChanged( width,height);

      result.success(entry.id());
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
