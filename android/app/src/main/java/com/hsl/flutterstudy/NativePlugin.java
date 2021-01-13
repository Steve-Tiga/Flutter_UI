package com.hsl.flutterstudy;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

public class NativePlugin implements FlutterPlugin {
    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        binding.getPlatformViewRegistry().registerViewFactory("<platform-view-type>", new NativeViewFactory(binding.getBinaryMessenger()));
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

    }
}
