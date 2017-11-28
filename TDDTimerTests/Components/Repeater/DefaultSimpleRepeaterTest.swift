import Quick
import Nimble
@testable import TDDTimer

class DefaultSimpleRepeaterTest: QuickSpec {
    override func spec() {
        describe("the default simple repeater") {
            it("starts the timer") {
                let defaultRepeater = DefaultSimpleRepeater()
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeClosureToRepeat: nil
                )


                expect(defaultRepeater.isValid).to(beTrue())
            }

            it("invokes the closure to repeat after calling start") {
                let defaultRepeater = DefaultSimpleRepeater()


                var closureWasCalled = false
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeClosureToRepeat: {
                        closureWasCalled = true
                    }
                )
                RunLoop.advance()


                expect(closureWasCalled).to(beTrue())
            }

            it("invalidates the timer when stop is invoked") {
                let defaultRepeater = DefaultSimpleRepeater()
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeClosureToRepeat: nil
                )


                defaultRepeater.stop()


                expect(defaultRepeater.isValid).to(beFalse())
            }
        }
    }
}
