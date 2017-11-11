import UIKit

enum UIButtonStyle {
    case primary, negative

    func applyTo(button: UIButton) {
        switch (self) {

        case .primary:
            button.titleLabel?.font = UIFont.abcMediumFont(size: 15)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.abcDarkSkyBlue
            button.layer.borderColor = UIColor.abcBlueish.cgColor
            button.layer.borderWidth = 1.0
            break

        case .negative:
            button.titleLabel?.font = UIFont.abcMediumFont(size: 15)
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.abcLightRed
            button.layer.borderColor = UIColor.abcStrawberry.cgColor
            button.layer.borderWidth = 1.0
            break
        }
    }
}
