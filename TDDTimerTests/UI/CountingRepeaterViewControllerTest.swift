import Quick
import Nimble
@testable import TDDTimer

class CountingRepeaterViewControllerTest: QuickSpec {

    override func spec() {
        describe("a view controller that uses an injectable repeater") {
            let fakeRepeater = FakeRepeater()
            let countingRepeaterVC = CountingRepeaterViewController(
                repeater: fakeRepeater
            )
            countingRepeaterVC.view.setNeedsLayout()

            it("starts the repeater when the view controller loads") {
                expect(fakeRepeater.start_wasCalled).to(beTrue())
            }
        }
    }
    
}
