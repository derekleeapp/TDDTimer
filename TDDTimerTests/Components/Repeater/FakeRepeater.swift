import Foundation
@testable import TDDTimer

class FakeRepeater: Repeater {
    private(set) var start_wasCalled = false
    private(set) var start_arg: (
        timeInterval: NSTimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?
    )?

    var isValid: Bool {
        get {
            return false
        }
    }

    func start(
        timeInterval timeInterval: NSTimeInterval,
        maybeConditionToStop: (() -> Bool)?,
        maybeClosureToRepeat: (() -> ())?)
    {
        start_wasCalled = true
        start_arg = (
            timeInterval: timeInterval,
            maybeConditionToStop: maybeConditionToStop,
            maybeClosureToRepeat: maybeClosureToRepeat
        )
    }

    private(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
