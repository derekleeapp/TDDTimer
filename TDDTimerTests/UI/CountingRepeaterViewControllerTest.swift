import Quick
import Nimble
@testable import TDDTimer

class CountingRepeaterViewControllerTest: QuickSpec {

    override func spec() {
        describe("a view controller that uses an injectable repeater") {
            var fakeRepeater: FakeRepeater!
            var countingRepeaterVC: CountingRepeaterViewController!

            beforeEach {
                fakeRepeater = FakeRepeater()
                countingRepeaterVC = CountingRepeaterViewController(
                    repeater: fakeRepeater
                )

                self.prepareViewControllerForDisplay(countingRepeaterVC)
            }

            it("starts the repeater when the view controller loads") {
                expect(fakeRepeater.start_wasCalled).to(beTrue())
            }

            it("stops the repeater when the view controller disappears") {
                countingRepeaterVC.viewWillDisappear(false)


                expect(fakeRepeater.stop_wasCalled).to(beTrue())
            }
        }
    }

    private func prepareViewControllerForDisplay(viewController: UIViewController) {
        viewController.view.setNeedsLayout()
    }
    
}
