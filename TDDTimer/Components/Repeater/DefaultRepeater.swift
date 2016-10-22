import Foundation

protocol Repeater {
    func start(timeInterval: NSTimeInterval, closureToRepeat: (() -> ())?)
    func stop()
}

class DefaultRepeater: Repeater {
    var timer: NSTimer?
    var closureToRepeat: (() -> ())?

    func start(timeInterval: NSTimeInterval, closureToRepeat: (() -> ())?) {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            timeInterval,
            target: self,
            selector: #selector(timerInvocation),
            userInfo: nil,
            repeats: true
        )

        self.closureToRepeat = closureToRepeat
    }

    func stop() {
        // TODO
    }

    // MARK: - Private Methods
    @objc private func timerInvocation() {
        if let closureToRepeat = self.closureToRepeat {
            closureToRepeat()
        }
    }
}
