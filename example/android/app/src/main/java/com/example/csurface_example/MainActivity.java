package com.example.csurface_example;

import android.content.pm.ConfigurationInfo;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {

    private static final String TAG = MainActivity.class.getSimpleName();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        PackageManager packageManager = getPackageManager();
        FeatureInfo[] systemAvailableFeatures = packageManager.getSystemAvailableFeatures();
        FeatureInfo configurationInfo = null;
        for (FeatureInfo systemAvailableFeature : systemAvailableFeatures) {
            if (systemAvailableFeature.name == null && systemAvailableFeature.reqGlEsVersion != ConfigurationInfo.GL_ES_VERSION_UNDEFINED) {
                configurationInfo = systemAvailableFeature;
            }
        }
        if (configurationInfo != null) {
            int glEsVersion = configurationInfo.reqGlEsVersion;
            String glEsVersionString = ((glEsVersion & 0xffff0000) >> 16) + "." + (glEsVersion & 0xffff);

            Log.d(TAG, "OpenGL ES Version: " + glEsVersionString);
        } else {
            Log.d(TAG, "OpenGL ES Version not found");
        }
    }
}
