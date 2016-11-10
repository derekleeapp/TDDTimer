import Quick
import Nimble
@testable import TDDTimer

class DefaultRepeaterTest: QuickSpec {

    override func spec() {
        describe("the default repeater") {
            it("starts the timer") {
                let defaultRepeater = DefaultRepeater()
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeConditionToStop: nil,
                    maybeClosureToRepeat: nil
                )


                expect(defaultRepeater.isValid).to(beTrue())
            }

            it("invokes the closure to repeat after calling start") {
                let defaultRepeater = DefaultRepeater()


                var closureWasCalled = false
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeConditionToStop: nil,
                    maybeClosureToRepeat: {
                        closureWasCalled = true
                    }
                )


                NSRunLoop.advance()

                expect(closureWasCalled).to(beTrue())
            }

            it("invalidates the timer when stop is invoked") {
                let defaultRepeater = DefaultRepeater()
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeConditionToStop: nil,
                    maybeClosureToRepeat: nil
                )


                defaultRepeater.stop()


                expect(defaultRepeater.isValid).to(beFalse())
            }

            it("stops the timer automatically when the stop condition is met") {
                let defaultRepeater = DefaultRepeater()
                defaultRepeater.start(
                    timeInterval: 0.01,
                    maybeConditionToStop: {
                        return true
                    },
                    maybeClosureToRepeat: nil
                )


                expect(defaultRepeater.isValid).toEventually(beFalse())
            }
        }
    }
}
