import UIKit
import Nimble

public func containLabelWithText(searchText: String) -> NonNilMatcherFunc<UIViewController> {
    return NonNilMatcherFunc { expression, failureMessage in
        guard let viewController = try expression.evaluate() else {
            return false
        }

        for subview in viewController.view.subviews {
            if let label = subview as? UILabel {
                if label.text == searchText {
                    return true
                }
            }
        }

        failureMessage.actualValue = nil
        failureMessage.postfixMessage = "find a label with the text '\(searchText)'"

        return false
    }
}
