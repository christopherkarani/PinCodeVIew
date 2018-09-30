//
//  PinCodeView.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit


protocol PinCodeViewable {
    
}

struct ViewsStack {
    enum StackError: Error {
        case indexOutOfBounds
    }
    private var inputViews = [UIView.autoLayout(), UIView.autoLayout(),UIView.autoLayout(),UIView.autoLayout()]
}

extension ViewsStack {
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func hide(at index: Int) {
        let subView = inputViews[index]
        subView.subviews.forEach { $0.isHidden = true }
    }
    
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func show(at index: Int) {
        let subView = inputViews[index]
        subView.subviews.forEach { $0.isHidden = true }
    }
    
    
    /// Hides all astreix
    func clear() {
        for view in inputViews {
            view.subviews.forEach { $0.isHidden = true }
        }
    }
}
    

// Give us the access to collection methods
extension ViewsStack: Collection {
    var startIndex: Int {
        return inputViews.startIndex
    }
    
    var endIndex: Int {
        return inputViews.endIndex
    }
    
    func index(after i: Int) -> Int {
        return inputViews.index(after: i)
    }
    
    public subscript(position: Int) -> UIView {
        return inputViews[position]
    }
}


/// handles the pin code View
class PinCodeView: UIView {
    private let containerView: UIView
    
    
    // MARK: Public Methods
    
    public let stack = ViewsStack()
    
    
    
    // MARK: Init
    init(container view: UIView) {
        containerView = view
        super.init(frame: .zero)
        layoutViews()
    }
    
    /// An algorith to layout pinView and its imageView subview
    private func layoutViews() {
        var lastView : UIView!
        var anchor : NSLayoutXAxisAnchor!
        
        /// Loop and prepeare the inputViews
        for view in inputViews {
            let imageView = UIImageView(image: UIImage(named: "asterisk")!)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            view.randomBackgroundColor()
            containerView.addSubview(view)
            
            // if is layout out the first view attach its anchor to the container view
            anchor = view == inputViews.first! ? containerView.leftAnchor : lastView.rightAnchor
            view.addSubview(imageView)
            imageView.center()
            
            NSLayoutConstraint.activate([
                view.leftAnchor.constraint(equalTo: anchor, constant: 12),
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                view.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/5),
                view.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/5)
                ])
            
            lastView = view
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// ToDO
// [REVIEW] 1. You should be able to hide one asterix at a time
// [REVIEW] 2. You should be able to show one asterix at a time
// 3. you should be able to erase all asterisx
// 4.  you should be able to highlight views red for error
// 5.  should be able to connect to a uitextfield and recieve notifications about text input
