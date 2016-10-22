import Foundation
@testable import TDDTimer

private let oneHundredthOfASecond: NSTimeInterval = 0.01

extension NSRunLoop {
    static func advance(by timeInterval: NSTimeInterval = oneHundredthOfASecond) {
        let stopDate = NSDate().dateByAddingTimeInterval(timeInterval)
        mainRunLoop().runUntilDate(stopDate)
    }
}
