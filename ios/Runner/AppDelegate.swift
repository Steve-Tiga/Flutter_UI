import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    //加载原生视图
    let fristRegistrar:FlutterPluginRegistrar = self.registrar(forPlugin: "FristView")!;
    let fristFactory = FristViewFactory(messenger: fristRegistrar.messenger())
    fristRegistrar.register(fristFactory, withId: "FristView");

    //flutter向原生视图传递
    let secendRegistrar:FlutterPluginRegistrar = self.registrar(forPlugin: "SecendView")!;
    let secendFactory = SecendViewFactory(messenger: secendRegistrar.messenger())
    secendRegistrar.register(secendFactory, withId: "SecendView");
    
    //原生视图向flutter传递
    let threeRegistrar:FlutterPluginRegistrar = self.registrar(forPlugin: "ThreeView")!;
    let threeFactory = ThreeViewFactory(messenger: threeRegistrar.messenger())
    threeRegistrar.register(threeFactory, withId: "ThreeView");
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
