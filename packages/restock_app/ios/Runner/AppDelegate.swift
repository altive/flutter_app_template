import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // ローカル通知に必要な設定
    UNUserNotificationCenter.current().delegate = self

    let buildMode = BuildMode.current
    let flavor = Flavor.current
    print("BuildMode: \(buildMode), Flavor: \(flavor)")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
