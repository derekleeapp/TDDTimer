import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool
    {
        window = UIWindow()
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()

        return true
    }

}
