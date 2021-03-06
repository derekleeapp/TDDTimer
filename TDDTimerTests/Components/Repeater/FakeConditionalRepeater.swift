import Foundation
@testable import TDDTimer

class FakeConditionalRepeater: ConditionalRepeater {
    fileprivate(set) var start_wasCalled = false
    fileprivate(set) var start_arg: (
        timeInterval: TimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?
    )?

    var isValid: Bool {
        get {
            return false
        }
    }

    func start(
        timeInterval: TimeInterval,
        conditionToStop maybeConditionToStop: (() -> Bool)?,
        closureToRepeat maybeClosureToRepeat: (() -> ())?)
    {
        start_wasCalled = true
        start_arg = (
            timeInterval: timeInterval,
            maybeConditionToStop: maybeConditionToStop,
            maybeClosureToRepeat: maybeClosureToRepeat
        )
    }

    fileprivate(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
