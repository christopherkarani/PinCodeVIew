//
//  ViewController.swift
//  PinCode
//
//  Created by Chris Karani on 29/09/2018.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinView = PinCodeView(container: makeViewContainer())
        view.addSubview(pinView)
        view.backgroundColor = .white
    }

    
    
    func makeViewContainer() -> UIView {
        let containerView = UIView.autoLayout()
        containerView.backgroundColor = .lightGray
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

