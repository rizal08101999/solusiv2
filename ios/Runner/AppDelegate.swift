import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let deviceInfoChannel = FlutterMethodChannel(name: "device/info",
                                              binaryMessenger: controller.binaryMessenger)
    
    deviceInfoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "deviceId" {
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
          result(uuid)
        } else {
          result(FlutterError(code: "UNAVAILABLE",
                              message: "Device ID not available",
                              details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
