import UIKit
import PureLayout

class CountingRepeaterViewController: UIViewController {
    // MARK: - Properties
    fileprivate let repeater: Repeater
    fileprivate let maximumCountValue: Int
    fileprivate var counterValue: Int

    // MARK: - View Elements
    let countingLabel: UILabel

    // MARK: - Initialization
    init(repeater: Repeater,
         maximumCountValue: Int)
    {
        self.repeater = repeater
        self.maximumCountValue = maximumCountValue

        counterValue = 1

        countingLabel = UILabel.newAutoLayout()

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

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        repeater.stop()
    }
}

// MARK: - Private Methods
extension CountingRepeaterViewController {
    fileprivate func addSubviews() {
        view.addSubview(countingLabel)
    }

    fileprivate func addConstraints() {
        countingLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        countingLabel.autoAlignAxis(toSuperviewAxis: .vertical)
    }

    fileprivate func configureSubviews() {
        view.backgroundColor = UIColor.white

        updateCountingLabel()
    }

    fileprivate func updateCountingLabel() {
        countingLabel.text = "\(counterValue)"
    }
}
