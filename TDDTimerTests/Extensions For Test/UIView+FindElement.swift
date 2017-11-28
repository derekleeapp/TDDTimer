import UIKit

extension UIView {
    func hasLabel(withText searchText: String) -> Bool {
        for subview in subviews {
            if let label = subview as? UILabel {
                if label.text == searchText {
                    return true
                }
            }

            if (subview.subviews.count > 0) {
                if subview.hasLabel(withText: searchText) {
                    return true
                }
            }
        }

        return false
    }
}
