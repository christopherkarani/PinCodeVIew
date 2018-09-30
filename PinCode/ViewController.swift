//
//  ViewController.swift
//  PinCode
//
//  Created by Chris Karani on 29/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

extension Optional {
    var isSafeOptional: Bool {
        switch self {
        case .none: return false
        case .some: return true
        }
    }
}









class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white

    }

    func setup() {
        _ = PinCodeView(container: makeViewContainer())
    }
    
    func makeViewContainer() -> UIView {
        let containerView = UIView.autoLayout()
        containerView.backgroundColor = .white
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: view.frame.width - 14),
            containerView.heightAnchor.constraint(equalToConstant: 150)
            ])
        return containerView
    }

}
// MARK: Collections

