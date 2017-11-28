import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow()

        let repeater = DefaultConditionalRepeater()
        let countingRepeaterViewController = CountingRepeaterViewController(
            repeater: repeater,
            maximumCountValue: 10
        )

        window?.rootViewController = countingRepeaterViewController
        window?.makeKeyAndVisible()

        return true
    }

}
