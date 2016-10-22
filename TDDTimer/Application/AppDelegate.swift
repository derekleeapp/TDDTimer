import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool
    {
        window = UIWindow()

        let repeater = DefaultRepeater()
        let countingRepeaterViewController = CountingRepeaterViewController(repeater: repeater)

        window?.rootViewController = countingRepeaterViewController
        window?.makeKeyAndVisible()

        return true
    }

}
