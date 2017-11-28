import UIKit

extension UIViewController {
    func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
    
    func hasLabel(withText searchText: String) -> Bool {
        return view.hasLabel(withText: searchText)
    }
}
