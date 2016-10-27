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

            it("reports valid status when running") {
                let defaultRepeater = DefaultRepeater()


                var isValid = false
                defaultRepeater.start(0.01) {
                    isValid = defaultRepeater.valid()
                }


                NSRunLoop.advance()

                expect(isValid).to(beTrue())
            }

            it("reports invalid status when not running") {
                let defaultRepeater = DefaultRepeater()

                expect(defaultRepeater.valid()).to(beFalse())
            }

            it("stops running after calling stop") {
                let defaultRepeater = DefaultRepeater()


                defaultRepeater.start(0.01) {}
                NSRunLoop.advance()
                defaultRepeater.stop()


                expect(defaultRepeater.valid()).to(beFalse())
            }

        }
    }
}
