import UIKit

class CountingRepeaterViewController: UIViewController {
    // MARK: - Properties
    let repeater: Repeater

    // MARK: - Initialization
    init(repeater: Repeater) {
        self.repeater = repeater

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
