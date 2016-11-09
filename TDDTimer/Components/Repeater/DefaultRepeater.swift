import Foundation

protocol Repeater {
    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultRepeater: Repeater {
    private(set) var timer: NSTimer?
    private(set) var maybeClosureToRepeat: (() -> ())?

    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?)
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.maybeClosureToRepeat = maybeClosureToRepeat
    }

    func stop() {
        timer?.invalidate()
    }

    // MARK: - Private Methods
    @objc private func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
