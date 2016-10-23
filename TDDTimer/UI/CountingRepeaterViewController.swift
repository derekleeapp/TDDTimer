import UIKit
import PureLayout

class CountingRepeaterViewController: UIViewController {
    // MARK: - Properties
    let repeater: Repeater

    private var counterValue: Int

    // MARK: - View Elements
    let countingLabel: UILabel

    // MARK: - Initialization
    init(repeater: Repeater) {
        self.repeater = repeater

        counterValue = 1

        self.countingLabel = UILabel.newAutoLayoutView()

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        configureSubviews()

        repeater.start(1) {
            self.updateCountingLabel()
            self.counterValue += 1
        }
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        repeater.stop()
    }

    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(countingLabel)
    }

    private func addConstraints() {
        countingLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        countingLabel.autoAlignAxisToSuperviewAxis(.Vertical)
    }

    private func configureSubviews() {
        view.backgroundColor = UIColor.whiteColor()

        updateCountingLabel()
    }

    private func updateCountingLabel() {
        countingLabel.text = "\(counterValue)"
    }
}
