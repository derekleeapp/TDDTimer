import Foundation

protocol Repeater {
    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultRepeater: Repeater {
    var timer: NSTimer?
    var maybeClosureToRepeat: (() -> ())?

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
        // TODO
    }

    // MARK: - Private Methods
    @objc private func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
