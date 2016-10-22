import Foundation
@testable import TDDTimer

class FakeRepeater: Repeater {
    private(set) var start_wasCalled = false
    private(set) var start_arg: (timeInterval: NSTimeInterval, closureToRepeat: (() -> ())?)?

    func start(
        timeInterval: NSTimeInterval,
        closureToRepeat: (() -> ())?)
    {
        start_wasCalled = true
        start_arg = (timeInterval: timeInterval, closureToRepeat: closureToRepeat)
    }

    private(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
