import UIKit
import YandexMobileAds
import DishFinderDI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        RegisterAssembly.shared.registerAssembly()
        MobileAds.initializeSDK(completionHandler: completionHandler)
        return true
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        @Dependency var tabBarModule: TabBarViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarModule
        window?.makeKeyAndVisible()
        return true
    }

    func completionHandler() {
        print(">>> YandexMobileAds")
    }
}
