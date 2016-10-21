import UIKit

func startApplication(delegateClassName: String) {
    UIApplicationMain(
        Process.argc,
        Process.unsafeArgv,
        String(UIApplication),
        delegateClassName
    )
}

class TestingAppDelegate: UIApplication, UIApplicationDelegate {}

if NSClassFromString("XCTestCase") != nil {
    startApplication(NSStringFromClass(TestingAppDelegate))
} else {
    startApplication(NSStringFromClass(AppDelegate))
}
