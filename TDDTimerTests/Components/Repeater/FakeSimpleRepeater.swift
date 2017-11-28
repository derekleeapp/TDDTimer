import Foundation
@testable import TDDTimer

class FakeSimpleRepeater: SimpleRepeater {
    fileprivate(set) var start_wasCalled = false
    fileprivate(set) var start_arg: (
        timeInterval: TimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )?

    var isValid: Bool {
        get {
            return false
        }
    }

    func start(
        timeInterval: TimeInterval,
        maybeClosureToRepeat: (() -> ())?)
    {
        start_wasCalled = true
        start_arg = (
            timeInterval: timeInterval,
            maybeClosureToRepeat: maybeClosureToRepeat
        )
    }

    fileprivate(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
