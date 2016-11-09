import Foundation

protocol Repeater {
    var isValid: Bool { get }

    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultRepeater: Repeater {
    private var maybeTimer: NSTimer?
    private(set) var maybeClosureToRepeat: (() -> ())?

    var isValid: Bool {
        get {
            if let timer = maybeTimer {
                return timer.valid
            }

            return false
        }
    }

    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?)
    {
        maybeTimer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.maybeClosureToRepeat = maybeClosureToRepeat
    }

    func stop() {
        maybeTimer?.invalidate()
    }

    // MARK: - Private Methods
    @objc private func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
