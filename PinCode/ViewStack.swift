//
//  ViewStack\.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit


struct ViewsStack {
    private var inputViews : [UIView] = []
    internal var count : Int
    private var image: UIImage
    
    public init(count: Int, asterixImage: UIImage) {
        self.count = count
        self.image = asterixImage
        create()
    }
    
    /**
     create new `ViewStack` pin views ready for use
 */
    mutating fileprivate func create() {
        for _ in 1...count {
            let view = UIView.autoLayout()
            let imageView = UIImageView(image: image)
            view.addSubview(imageView)
            imageView.autoLayout()
            imageView.center()
            inputViews.append(view)
        }
    }
}

extension ViewsStack {
    
}

extension ViewsStack {
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func hide(at index: Int) {
        let subView = inputViews[index]
        subView.subviews.first!.isHidden = true
    }
    
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func show(at index: Int) {
        let subView = inputViews[index]
        subView.subviews.first!.isHidden = false
    }
    
    
    /// Hides all astreix
    func clear() {
        for view in inputViews {
            view.subviews.first!.isHidden = true
        }
    }
    
    /// Show an Error
    func error() {
        inputViews.forEach {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.red.cgColor
            $0.backgroundColor = .gray
        }
    }
    
    
    /// clear the effects of Error User Experiance
    func clearError() {
        inputViews.forEach {
            $0.layer.borderWidth = 0
            $0.layer.borderColor = UIColor.clear.cgColor
            $0.backgroundColor = .clear
        }
    }
    
    // to do: add value for rounding based on half the views width or height
    func roundInputView() {
        for view in inputViews {
            view.clipsToBounds = true
            view.layer.cornerRadius = view.frame.width / 2
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


extension ViewsStack {
    /// An algorith to layout pinView and its imageView subview
    public func layout(in containerView: UIView) {
        var lastView : UIView!
        var anchor : NSLayoutXAxisAnchor!
        //inputViews.forEach { $0.autoLayout(); $0.center() }
        
        /// Loop and prepeare the inputViews
        for view in self {
            view.randomBackgroundColor()
            containerView.addSubview(view)
            
            // if is layout out the first view attach its anchor to the container view
            anchor = view == self.first! ? containerView.leftAnchor : lastView.rightAnchor
            
            NSLayoutConstraint.activate([
                view.leftAnchor.constraint(equalTo: anchor, constant: 12),
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                view.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/5),
                view.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/5)
                ])
            
            lastView = view
            lastView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}


//TODO
// 1. allow differnt number of input views
// 2. make subviews into a subSeequence


