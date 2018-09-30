//
//  PinCodeView.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

/// handles the pin code View
class PinCodeView: UIView {
    
    private var stack : ViewsStack!
    // MARK: Init
    init(container view: UIView) {
        super.init(frame: view.frame)
        stack = ViewsStack(type: .four, asterixImage: UIImage.asterix)
        stack.layout(in: view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// ToDO
// [DONE] 1. You should be able to hide one asterix at a time
// [DONE] 2. You should be able to show one asterix at a time
// [DONE] 3. you should be able to erase all asterisx
// [DONE] 4.  you should be able to highlight views red for error
// [IN PROGRESS] 5.should be able to connect to a uitextfield and recieve notifications about text input
