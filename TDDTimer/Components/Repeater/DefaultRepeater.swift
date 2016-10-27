import Foundation

protocol Repeater {
    func start(timeInterval: NSTimeInterval, closureToRepeat: (() -> ())?)
    func stop()
}

class DefaultRepeater: Repeater {
    private var maybeTimer: NSTimer?
    private var closureToRepeat: (() -> ())?

    func start(timeInterval: NSTimeInterval, closureToRepeat: (() -> ())?) {
        maybeTimer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.closureToRepeat = closureToRepeat
    }

    func stop() {
        maybeTimer?.invalidate()
    }

    func valid() -> Bool {

        if let timer = maybeTimer {
            return timer.valid
        }

        return false
    }

    // MARK: - Private Methods
    @objc private func timerInvocation() {
        if let closureToRepeat = self.closureToRepeat {
            closureToRepeat()
        }
    }
}
