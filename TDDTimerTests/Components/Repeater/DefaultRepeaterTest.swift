import Quick
import Nimble
@testable import TDDTimer

class DefaultRepeaterTest: QuickSpec {

    override func spec() {
        describe("the default repeater") {

            it("invokes the closure to repeat after calling start") {
                let defaultRepeater = DefaultRepeater()


                var closureWasCalled = false
                defaultRepeater.start(0.01) {
                    closureWasCalled = true
                }


                NSRunLoop.advance()

                expect(closureWasCalled).to(beTrue())
            }

        }
    }
}
