import UIKit
import PureLayout

class CountingRepeaterViewController: UIViewController {
    // MARK: - Properties
    fileprivate let repeater: ConditionalRepeater
    fileprivate let maximumCountValue: Int
    fileprivate var counterValue: Int

    // MARK: - View Elements
    let headerLabel: UILabel
    let countingLabel: UILabel
    let confirmButton: UIButton
    let cancelButton: UIButton

    // MARK: - Initialization
    init(repeater: ConditionalRepeater,
         maximumCountValue: Int)
    {
        self.repeater = repeater
        self.maximumCountValue = maximumCountValue

        counterValue = 1

        headerLabel = UILabel.newAutoLayout()
        countingLabel = UILabel.newAutoLayout()
        confirmButton = UIButton.init(type: .system)
        cancelButton = UIButton.init(type: .system)

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        configureSubviews()
        applyStyles()

        repeater.start(
            timeInterval: 1,
            conditionToStop: {
                return self.counterValue >= self.maximumCountValue
            },
            closureToRepeat:  {
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
fileprivate extension CountingRepeaterViewController {
    func addSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(countingLabel)
        view.addSubview(confirmButton)
        view.addSubview(cancelButton)
    }

    func addConstraints() {
        headerLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        headerLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        countingLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        countingLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        confirmButton.autoPinEdge(toSuperviewEdge: .right, withInset: 20.0)
        confirmButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20.0)
        confirmButton.autoSetDimension(.width, toSize: 100.0)

        cancelButton.autoPinEdge(toSuperviewEdge: .left, withInset: 20.0)
        cancelButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 20.0)
        cancelButton.autoSetDimension(.width, toSize: 100.0)
    }

    func configureSubviews() {
        view.backgroundColor = UIColor.white

        headerLabel.text = "Counting Timer Test"
        updateCountingLabel()

        confirmButton.setTitle("Confirm", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
    }

    func applyStyles() {
        headerLabel.apply(style: .header)
        countingLabel.apply(style: .caption)
        confirmButton.apply(style: .primary)
        cancelButton.apply(style: .negative)
    }

    func updateCountingLabel() {
        countingLabel.text = "\(counterValue)"
    }
}
