import UIKit
import Flutter
<<<<<<< HEAD
=======
import Firebase
>>>>>>> 68416fc1c768153dc5a5adcf3b7b01f5952493ea

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
<<<<<<< HEAD
    GeneratedPluginRegistrant.register(with: self)
=======
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)

>>>>>>> 68416fc1c768153dc5a5adcf3b7b01f5952493ea
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
