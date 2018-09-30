//
//  ViewStack\.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit


final class AstrixView : UIView {
    private let asterix = UIImageView(image: UIImage(named: "asterix"))
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
    
    public func image() -> UIImage {
        let copy = asterix.copy() as! UIImage
        return copy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct ViewsStack {
    private var inputViews : [AstrixView] = []
    internal var count : Int
    private var hasViews: Bool = false
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
        for _ in 0...count {
            let view = AstrixView.autoLayout()
            inputViews.append(view)
        }
        
        if inputViews.count == 0 { hasViews = false }
    }
}

extension ViewsStack {
    
}

extension ViewsStack {
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func hide(at index: Int) {
        guard hasViews else { return }
        inputViews[index].hide()
    }
    
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    func show(at index: Int) {
        guard hasViews else { return }
        inputViews[index].show()
    }
    
    
    /// Hides all astreix
    func clear() {
        guard hasViews else { return }
        for view in inputViews {
            view.asterix.isHidden = true
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
    
    public subscript(imageView pos: Int) -> AstrixView {
        let view = inputViews[pos]
        return view.asterix
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

extension UIView {
    func firstSubview() -> UIImageView {
        return subviews.first! as! UIImageView
    }
}


//TODO
// 1. allow differnt number of input views
// 2. make subviews into a subSeequence


