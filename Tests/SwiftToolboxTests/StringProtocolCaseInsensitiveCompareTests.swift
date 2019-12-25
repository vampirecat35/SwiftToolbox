//
//  Copyright © 2018 Werner Freytag. All rights reserved.
//

import Nimble
@testable import SwiftToolbox
import XCTest

class StringProtocolCaseInsensitiveCompareTests: XCTestCase {
    func testCompareEquals() {
        expect("Hello" ~ "hello") == true
        expect("hello" ~ "Hello") == true
        expect("hellO" ~ "HellO") == true
        expect("hellö" ~ "HellO") == false
    }

    func testCompareLessThan() {
        expect("Hello" ~< "hello") == false
        expect("hello" ~< "Hello") == false
        expect("hellO" ~< "HellO") == false
        expect("hellO 1" ~< "HellO 2") == true
    }

    func testMatchAgainst() {
        expect("Hello".match(against: "hello")) == 1
        expect("Hello".match(against: "hello", options: [])) == 0 // Case sensitive
        expect("Hello_".match(against: "hello")) ≈ 0.8333
        expect("_Hello".match(against: "hello")) ≈ 0.75
        expect("H_ello".match(against: "hello")) ≈ 0.75
        expect("__Hello".match(against: "hello")) ≈ 0.619
    }

    static var allTests = [
        ("testCompareEquals", testCompareEquals),
        ("testCompareLessThan", testCompareLessThan),
        ("testMatchAgainst", testMatchAgainst),
    ]
}
