import Foundation

protocol SimpleRepeater {
    var isValid: Bool { get }

    func start(
        timeInterval: TimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultSimpleRepeater {
    fileprivate var maybeTimer: Timer?
    fileprivate var maybeClosureToRepeat: (() -> ())?
}

// MARK: - Repeater
extension DefaultSimpleRepeater: SimpleRepeater {
    var isValid: Bool {
        get {
            if let timer = maybeTimer {
                return timer.isValid
            }

            return false
        }
    }

    func start(
        timeInterval: TimeInterval,
        maybeClosureToRepeat: (() -> ())?)
    {
        maybeTimer = Timer.scheduledTimer(
            timeInterval: timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.maybeClosureToRepeat = {
            if let closureToRepeat = maybeClosureToRepeat {
                closureToRepeat()
            }
        }
    }

    func stop() {
        maybeTimer?.invalidate()
    }
}

// MARK: - Private Methods
extension DefaultSimpleRepeater {
    @objc fileprivate func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
