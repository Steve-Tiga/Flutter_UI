//
//  ThreeViewFactory.swift
//  Runner
//
//  Created by 猫态科技 on 2020/12/30.
//

import Foundation
import Flutter

class ThreeViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var messenger:FlutterBinaryMessenger
    
    init(messenger:FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return ThreeView(frame,viewID: viewId,args: args,messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

class ThreeView: NSObject,FlutterPlatformView {
    let button = UIButton()
    var methodChannel = FlutterMethodChannel()
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        super.init()

        button.setTitle(("点击传递参数给flutter"), for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        methodChannel = FlutterMethodChannel(name: "ThreeView_MethodChannel", binaryMessenger: messenger)
    }
    

    
    @objc func click() {
        NSLog("点击了按钮")
        methodChannel.invokeMethod("sendToFlutter", arguments:["param":"原生传递的数据"])
    }
    
    func view() -> UIView {
        return button
    }
}
