//
//  ViewStackTests.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import XCTest
@testable import NoStress


class ViewStackTests: XCTestCase {
    
    let viewStack = ViewsStack(type: .four, asterixImage: UIImage.asterix)

    
    func testViewStackCountTest() {
        let count = viewStack.count
        XCTAssertTrue(count == 4)
    }
    
    func testStackViewsContainsSubViews() {
        // the view contains one and only one subview
        for view in viewStack {
            XCTAssertTrue(view.subviews.count == 1)
        }
    }
        
        
    func test_StackViewsClear() {
        let stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        stack.clear()
        XCTAssertTrue(stack[0].asterixIsHidden == true)
    }
    
    func testStackViewsAddOne() {
        let stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        stack.clear()
        stack.show(at: 0)
        XCTAssertTrue(stack[0].asterixIsHidden == false)
    }
    
    func testStackViewsAddTwo() {
        let stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        stack.clear()
        stack.show(at: 0)
        stack.show(at: 1)
        let conditions = [
            stack[0].asterixIsHidden == false,
            stack[1].asterixIsHidden == false
        ]
        for c in conditions {
            XCTAssertTrue(c)
        }
        
    }
    
    func testStackViewsAddThree() {
        let stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        stack.clear()
        stack.show(at: 0)
        stack.show(at: 2)
        stack.show(at: 1)
        let conditions = [
            stack[0].asterixIsHidden == false,
            stack[1].asterixIsHidden == false,
            stack[2].asterixIsHidden == false
        ]
        for c in conditions {
            XCTAssertTrue(c)
        }
    }
    
    func testStackViewsAddFour() {
        let stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        
        stack.clear()
        stack.show(at: 0)
        stack.show(at: 1)
        stack.show(at: 2)
        stack.show(at: 3)
        let conditions = [
            stack[0].asterixIsHidden == false,
            stack[1].asterixIsHidden == false,
            stack[2].asterixIsHidden == false,
            stack[3].asterixIsHidden == false,
            ]
        for c in conditions {
            XCTAssertTrue(c)
        }
    }
    
}
