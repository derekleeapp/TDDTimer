@testable import TDDTimer

class FakeRepeater: Repeater {
    private(set) var start_wasCalled = false
    func start() {
        start_wasCalled = true
    }
}
