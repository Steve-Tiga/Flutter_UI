package com.hsl.flutterstudy;

import android.content.Context;
import android.view.View;
import androidx.annotation.Nullable;
import androidx.annotation.NonNull;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import java.util.Map;

class NativeViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public NativeViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        return new NativeView(context, id, creationParams);
    }
}