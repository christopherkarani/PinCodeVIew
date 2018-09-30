//
//  ViewStack\.swift
//  PinCode
//
//  Created by Chris Karani on 30/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

struct ViewsStack {
    /// the number of views expected for input
    private var inputViews : [AstrixView] = []
    private var hasViews: Bool = false
    private var image: UIImage
    public var type : PinType
    public lazy var pinCount = type.rawValue
    
    public init(type: PinType, asterixImage: UIImage) {
        self.image = asterixImage
        self.type = type
        create()
    }
    
    /**
     create new `ViewStack` pin views ready for use
     */
    mutating fileprivate func create() {
        for _ in 0..<pinCount {
            let view = AstrixView.autoLayout()
            inputViews.append(view)
        }
    }
}

extension  ViewsStack {
    /// - Parameter index: location in the inputs collection
    public func hide(at index: Int) {
        guard inputViews.count > 0 else { return }
        inputViews[index].hide()
    }
    
    /// show an asterix at a certain index
    /// - Parameter index: location in the inputs collection
    public func show(at index: Int) {
        guard inputViews.count > 0 else { return }
        inputViews[index].show()
    }
    
    /// Hides all astreix
    public func clear() {
        guard inputViews.count > 0 else { return }
        for view in inputViews {
            view.hide()
        }
    }
    
    /// Show an Error
    public func error() {
        inputViews.forEach {
            $0.layer.borderWidth = 2
            $0.layer.borderColor = UIColor.red.cgColor
            $0.backgroundColor = .gray
        }
    }
    
    
    /// clear the effects of Error User Experiance
    public func clearError() {
        inputViews.forEach {
            $0.layer.borderWidth = 0
            $0.layer.borderColor = UIColor.clear.cgColor
            $0.backgroundColor = .clear
        }
    }
    
    // to do: add value for rounding based on half the views width or height
    private func roundInputView() {
        for view in inputViews {
            view.clipsToBounds = true
            view.layer.cornerRadius = view.frame.width / 2
        }
    }
    
    /**
     Get the `UImage` belonging to the `AsterixView` at this Index
     - Parameter pos: The Index at which to retrieve the `UImage`
     */
    public subscript(image pos: Int) -> UIImage? {
        let imageView = inputViews[pos].imageView()
        return imageView.image
    }
    
    /**
     Get the `UIImageView` belonging to the `AsterixView` at this Index
     - Parameter pos: The Index at which to retrieve the `UImageview`
     */
    public subscript(imageView pos: Int) -> UIImageView? {
        return inputViews[pos].imageView()
    }
    
    /// An algorith to layout pinView and its imageView subview
    public func layout(in container: UIView) {
        let stackView = UIStackView(arrangedSubviews: inputViews)
        stackView.spacing = 12
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        container.addSubview( stackView)
        stackView.autoLayout()
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: type.multiplier)
            ])
        stackView.backgroundColor = .yellow
        container.layoutIfNeeded()
        
        stackView.arrangedSubviews.forEach {
            $0.backgroundColor = .white
            $0.round($0.frame.width / 2)
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
}


// Only Supports 4 Pin and 6 Pin Passwords. becuase beyond that or below that is not adaquet
extension ViewsStack {
    enum PinType: Int {
        case four = 4
        case six = 6
    }
}

extension ViewsStack.PinType {
    var multiplier: CGFloat {
        switch self {
        case .four: return 0.60
        case .six: return 0.40
        }
    }
}
// MARK: Subscripts
extension ViewsStack {
    /**
     Get the  the `AsterixView` at this Index
     - Parameter pos: The Index at which to retrieve the `AsterixView`
     */
    public subscript(position: Int) -> AstrixView {
        return inputViews[position]
    }

}


//TODO
// 1. allow differnt number of input views
// 2. make subviews into a subSeequence
// 3. draw for case four pin type and case six


