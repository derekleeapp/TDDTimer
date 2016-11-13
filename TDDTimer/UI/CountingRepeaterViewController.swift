import UIKit
import PureLayout

class CountingRepeaterViewController: UIViewController {
    // MARK: - Properties
    private let repeater: Repeater
    private let maximumCountValue: Int
    private var counterValue: Int

    // MARK: - View Elements
    let countingLabel: UILabel

    // MARK: - Initialization
    init(repeater: Repeater,
         maximumCountValue: Int)
    {
        self.repeater = repeater
        self.maximumCountValue = maximumCountValue

        counterValue = 1

        countingLabel = UILabel.newAutoLayoutView()

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

        repeater.start(
            timeInterval: 1,
            maybeConditionToStop: {
                return self.counterValue >= self.maximumCountValue
            },
            maybeClosureToRepeat:  {
                self.counterValue += 1
                self.updateCountingLabel()
            }
        )
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        repeater.stop()
    }
}

// MARK: - Private Methods
extension CountingRepeaterViewController {
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
