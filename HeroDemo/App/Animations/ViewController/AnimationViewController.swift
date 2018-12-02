//
//  AnimationViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol AnimationDelegate: AnyObject {
    func perform(action: AnimationAction)
}

enum AnimationAction {
    case heroAnimation(isEnabled: Bool)
    case next
}

class AnimationViewController: UIViewController {

    weak var delegate: AnimationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
    }

    @IBAction private func toggleIsHeroEnabled(_ sender: UISwitch) {
        delegate?.perform(action: .heroAnimation(isEnabled: sender.isOn))
    }

    @IBAction private func nextButtonDidPress(_ sender: UISwitch) {
        delegate?.perform(action: .next)
    }
}

