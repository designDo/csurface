package com.example.csurface;

import android.view.Surface;

public class SurfaceRender {

    static {
        System.loadLibrary("egl-render");
    }

    public native void nativeInit();
    public native void onSurfaceCreated(Surface surface);
    public native void onSurfaceChanged(int width, int height);
    public native void onSurfaceDestroyed();
}
