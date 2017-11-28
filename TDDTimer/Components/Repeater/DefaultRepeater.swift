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
    fileprivate var maybeTimerClosure: (() -> ())?
}

// MARK: - SimpleRepeater
extension DefaultSimpleRepeater: SimpleRepeater {
    var isValid: Bool {
        get {
            return maybeTimer?.isValid ?? false
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

        maybeTimerClosure = {
            if let closureToRepeat = maybeClosureToRepeat {
                closureToRepeat()
            }
        }
    }

    func stop() {
        maybeTimer?.invalidate()
    }
}

// MARK: - Actions
extension DefaultSimpleRepeater {
    @objc fileprivate func timerInvocation() {
        if let closureToRepeat = maybeTimerClosure {
            closureToRepeat()
        }
    }
}
