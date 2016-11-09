import Foundation
@testable import TDDTimer

class FakeRepeater: Repeater {
    private(set) var start_wasCalled = false
    private(set) var start_arg: (
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?
    )?

    func start(
        timeInterval: NSTimeInterval,
        maybeClosureToRepeat: (() -> ())?)
    {
        start_wasCalled = true
        start_arg = (
            timeInterval: timeInterval,
            maybeClosureToRepeat: maybeClosureToRepeat
        )
    }

    private(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
