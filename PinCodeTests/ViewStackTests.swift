//
//  ViewStackTests.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import XCTest
@testable import PinCode


class ViewStackTests: XCTestCase {
//    func viewStackCollectionTests() {
//        let viewStack = ViewsStack(count: 4, asterixImage: UIImage.asterix)
//        viewStack.count
//    }
    
    func viewStackCountTest() {
        let viewStack = ViewsStack(count: 4, asterixImage: UIImage.asterix)
        let count = viewStack.count
        XCTAssertTrue(count == 4)
    }
    
    func viewStackViewsContainsSubViews() {
        // the view contains one and only one subview
        let viewStack = ViewsStack(count: 8, asterixImage: UIImage.asterix)
        for view in viewStack {
            XCTAssertTrue(view.subviews.count == 1)
        }
        
        
    func viewStackViewsContainsSubViews() {
            // the view contains one and only one subview
            let viewStack = ViewsStack(count: 8, asterixImage: UIImage.asterix)
            for view in viewStack {
                XCTAssertTrue(view.subviews.count == 1)
            }
        }
        
        
    }
    
}
