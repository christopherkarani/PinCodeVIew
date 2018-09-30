//
//  AsterixView.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit


final class AstrixView : UIView {
    private let asterix = UIImageView(image: UIImage.asterix)
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(asterix)
        asterix.autoLayout()
        asterix.center()
        
    }
    
    public func hide() {
        asterix.isHidden = true
    }
    
    public func show() {
        asterix.isHidden = false
    }
    
    public func imageView() -> UIImageView {
        let copy = asterix.copy() as! UIImageView
        return copy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AstrixView {
    public var asterixIsHidden : Bool {
        return asterix.isHidden
    }
}


