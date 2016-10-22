import Quick
import Nimble
@testable import TDDTimer

class TDDTimerTests: QuickSpec {

    override func spec() {
        describe("wiring test") {
            let number = 12

            it("can execute properly") {
                expect(number).to(equal(12))
            }
        }
    }

}
