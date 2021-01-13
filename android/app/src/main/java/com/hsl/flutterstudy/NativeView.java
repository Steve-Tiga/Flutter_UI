package com.hsl.flutterstudy;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;
import io.flutter.plugin.platform.PlatformView;
import java.util.Map;

class NativeView implements PlatformView {
    private final TextView textView;

    NativeView(Context context, int id, Map<String, Object> creationParams) {
        textView = new TextView(context);
        textView.setTextSize(16);
        textView.setBackgroundColor(Color.rgb(233, 105, 64));
        textView.setText("安卓原生视图 (id: " + id + ")\n "+ creationParams +"");
    }

    @Override
    public View getView() {
        return textView;
    }

    @Override
    public void dispose() {}
}