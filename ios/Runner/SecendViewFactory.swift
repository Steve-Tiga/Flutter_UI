//
//  SecendViewFactory.swift
//  Runner
//
//  Created by 猫态科技 on 2020/12/30.
//

import Foundation
import Flutter

class SecendViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var messenger:FlutterBinaryMessenger
    
    init(messenger:FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return SecendView(frame,viewID: viewId,args: args,messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

class SecendView: NSObject,FlutterPlatformView {
    let label = UILabel()
    var methodChannel = FlutterMethodChannel()
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        super.init()
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            let pramaValue:String = dict.value(forKey: "text") as! String;
            let viewId:Int = Int(viewID)
            label.font = .systemFont(ofSize: 14)
            label.numberOfLines = 0
            label.text  = "参数：\(pramaValue),\nviewID：\(viewId)"
        }
        
        methodChannel = FlutterMethodChannel(name: "SecendView_\(viewID)", binaryMessenger: messenger)
        methodChannel.setMethodCallHandler { (call, result:FlutterResult) in
            if (call.method == "getData") {
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    result(["name":name])
                    self.label.text = "hello,\(name)"
                }
            }
        }
    }
    
    func view() -> UIView {
        return label
    }
}
