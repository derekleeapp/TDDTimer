import Foundation

protocol ConditionalRepeater {
    var isValid: Bool { get }
    
    func start(
        timeInterval: TimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?
    )
    func stop()
}

class DefaultConditionalRepeater {
    fileprivate var maybeTimer: Timer?
    fileprivate var maybeClosureToRepeat: (() -> ())?
}

// MARK: - Repeater
extension DefaultConditionalRepeater: ConditionalRepeater {
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
        maybeConditionToStop: (() -> Bool)?,
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

// MARK: - Actions
extension DefaultConditionalRepeater {
    @objc fileprivate func timerInvocation() {
        if let closureToRepeat = self.maybeClosureToRepeat {
            closureToRepeat()
        }
    }
}
