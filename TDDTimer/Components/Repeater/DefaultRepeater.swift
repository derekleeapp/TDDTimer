import Foundation

protocol Repeater {
    var isValid: Bool { get }

    func start(
        timeInterval timeInterval: NSTimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultRepeater {
    private var maybeTimer: NSTimer?
    private var maybeClosureToRepeat: (() -> ())?
}

// MARK: - Repeater
extension DefaultRepeater: Repeater {
    var isValid: Bool {
        get {
            if let timer = maybeTimer {
                return timer.valid
            }

            return false
        }
    }

    func start(
        timeInterval timeInterval: NSTimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?)
    {
        maybeTimer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.maybeClosureToRepeat = {
            if let closureToRepeat = maybeClosureToRepeat {
                closureToRepeat()
            }

            if let conditionToStop = maybeConditionToStop {
                if (conditionToStop()) {
                    self.stop()
                }
            }
        }
    }

    func stop() {
        maybeTimer?.invalidate()
    }
}

// MARK: - Private Methods
extension DefaultRepeater {
    @objc private func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
