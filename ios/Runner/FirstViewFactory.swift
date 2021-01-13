//
//  FirstViewFactory.swift
//  Runner
//
//  Created by 猫态科技 on 2020/12/30.
//

import Foundation
import Flutter

class FristViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var messenger:FlutterBinaryMessenger
    
    init(messenger:FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return FristView(frame,viewID: viewId,args: args,messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

class FristView: NSObject,FlutterPlatformView {
    let label = UILabel()
    
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
    }
    
    func view() -> UIView {
        return label
    }
}
