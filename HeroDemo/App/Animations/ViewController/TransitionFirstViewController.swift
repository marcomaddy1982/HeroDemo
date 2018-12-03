//
//  TransitionFirstViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol TransitionFirstDelegate: AnyObject {
    func perform(action: TransitionFirstAction)
}

enum TransitionFirstAction {
    case heroAnimation(isEnabled: Bool)
    case next
}

class TransitionFirstViewController: UIViewController {

    weak var delegate: TransitionFirstDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
    }

    @IBAction private func toggleIsHeroEnabled(_ sender: UISwitch) {
        delegate?.perform(action: .heroAnimation(isEnabled: sender.isOn))
    }

    @IBAction private func nextButtonDidPress(_ sender: UIButton) {
        delegate?.perform(action: .next)
    }
}

