@testable import TDDTimer

class FakeRepeater: Repeater {
    private(set) var start_wasCalled = false
    private(set) var start_arg: (() -> ())?
    func start(closureToRepeat: (() -> ())?) {
        start_wasCalled = true
        start_arg = closureToRepeat
    }

    private(set) var stop_wasCalled = false
    func stop() {
        stop_wasCalled = true
    }
}
