import UIKit

enum UILabelStyle {
    case header, caption

    func applyTo(label: UILabel) {
        switch (self) {

        case .header:
            label.font = UIFont.abcBoldFont(size: 24)
            label.textColor = UIColor.abcDarkSkyBlue
            break

        case .caption:
            label.font = UIFont.abcMediumFont(size: 16)
            label.textColor = UIColor.abcBlueish
            break
        }
    }
}
