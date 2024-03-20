#include <jni.h>
#include <string>
#include <android/native_window.h>
#include <android/native_window_jni.h>

#include "common/MyLooper.h"

MyLooper *mLooper = NULL;
ANativeWindow *mWindow = NULL;
GLRender *mRender =NULL;


extern "C" JNIEXPORT void JNICALL
Java_com_example_csurface_SurfaceRender_onSurfaceCreated(
        JNIEnv *env, jobject instance, jobject surface) {
    if (mWindow) {
        ANativeWindow_release(mWindow);
        mWindow = NULL;
    }
    mWindow = ANativeWindow_fromSurface(env, surface);
    LOGD("handle message MsgSurfaceCreated")
    if (mRender) {
        mRender->surfaceCreated(mWindow);
    }
    if (mLooper) {
        LOGD("post MsgSurfaceCreated")
        //mLooper->post(MsgSurfaceCreated, mWindow, true);
    }
}

extern "C" JNIEXPORT void JNICALL
Java_com_example_csurface_SurfaceRender_onSurfaceChanged(
        JNIEnv *env, jobject instance,
        jint width, jint height) {
    LOGD("handle message MsgSurfaceChanged")
    if (mRender) {
        mRender->surfaceChanged(width, height);
    }
    if (mLooper) {
        //mLooper->post(MsgSurfaceChanged, width, height);
    }
}

extern "C" JNIEXPORT void JNICALL
Java_com_example_csurface_SurfaceRender_onSurfaceDestroyed(
        JNIEnv *env, jobject instance) {
    LOGD("handle message MsgSurfaceDestroyed")
    if (mRender) {
        mRender->surfaceDestroyed();
    }
    if (mLooper) {
       // mLooper->post(MsgSurfaceDestroyed, NULL);
    }
}

extern "C"
JNIEXPORT void JNICALL
Java_com_example_csurface_SurfaceRender_nativeInit(JNIEnv *env, jobject thiz) {
    mLooper = new MyLooper();
    mRender = new GLRender();
}