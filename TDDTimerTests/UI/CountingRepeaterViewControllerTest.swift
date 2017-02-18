import Quick
import Nimble
@testable import TDDTimer

class CountingRepeaterViewControllerTest: QuickSpec {

    override func spec() {
        describe("a view controller that uses an injectable repeater") {
            var fakeRepeater: FakeRepeater!
            var countingRepeaterVC: CountingRepeaterViewController!

            context("when the repeater condition is valid") {
                beforeEach {
                    fakeRepeater = FakeRepeater()
                    countingRepeaterVC = CountingRepeaterViewController(
                        repeater: fakeRepeater,
                        maximumCountValue: 10
                    )

                    self.prepareViewControllerForDisplay(countingRepeaterVC)
                }

                describe("view elements") {
                    it("displays a single digit on the screen") {
                        expect(countingRepeaterVC).to(containLabelWithText("1"))
                    }
                }

                describe("interacting with the repeater") {
                    it("starts the repeater when the view controller loads") {
                        expect(fakeRepeater.start_wasCalled).to(beTrue())
                        expect(fakeRepeater.start_arg?.timeInterval).to(equal(1))
                        expect(fakeRepeater.start_arg?.maybeConditionToStop).toNot(beNil())
                        expect(fakeRepeater.start_arg?.maybeClosureToRepeat).toNot(beNil())
                    }

                    it("stops the repeater when the view controller disappears") {
                        countingRepeaterVC.viewWillDisappear(false)


                        expect(fakeRepeater.stop_wasCalled).to(beTrue())
                    }

                    it("configures the repeater to update the counting label") {
                        let oldLabelValue = countingRepeaterVC.countingLabel.text


                        if let closureToRepeat = fakeRepeater.start_arg?.maybeClosureToRepeat {
                            closureToRepeat()
                        }
                        RunLoop.advance()


                        let newLabelValue = countingRepeaterVC.countingLabel.text
                        expect(oldLabelValue).toNot(equal(newLabelValue))
                    }
                }
            }

            context("when the repeater condition is invalid") {
                beforeEach {
                    fakeRepeater = FakeRepeater()
                    countingRepeaterVC = CountingRepeaterViewController(
                        repeater: fakeRepeater,
                        maximumCountValue: 0
                    )

                    self.prepareViewControllerForDisplay(countingRepeaterVC)
                }

                it("stops the repeater when the counter reaches 2") {
                    let stopTimerResult = fakeRepeater.start_arg?.maybeConditionToStop!()


                    expect(stopTimerResult).to(beTrue())
                }
            }

        }
    }

    fileprivate func prepareViewControllerForDisplay(_ viewController: UIViewController) {
        viewController.view.setNeedsLayout()
    }
    
}
