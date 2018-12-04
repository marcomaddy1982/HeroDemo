//
//  RegistrationSecondViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 04.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

class RegistrationSecondViewController: UIViewController {

    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var phoneTextfield: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var pinLabel: UILabel!
    @IBOutlet private weak var pinTextfield: UITextField!
    @IBOutlet private weak var completeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration Step 2"
        setUpHeroIds()
    }

    private func setUpHeroIds() {
        phoneLabel.hero.id = HeroIdCreator.firstLabel.id
//        phoneLabel.hero.modifiers = [.fade]
        phoneTextfield.hero.id = HeroIdCreator.firstTextfield.id
//        phoneTextfield.hero.modifiers = [.fade]
        emailLabel.hero.id = HeroIdCreator.secondLabel.id
//        emailLabel.hero.modifiers = [.fade]
        emailTextfield.hero.id = HeroIdCreator.secondTextfield.id
//        emailTextfield.hero.modifiers = [.fade]
        pinLabel.hero.id = HeroIdCreator.secondLabel.id
//        pinLabel.hero.modifiers = [.fade]
        pinTextfield.hero.id = HeroIdCreator.secondTextfield.id
//        pinTextfield.hero.modifiers = [.fade]
        completeButton.hero.id = HeroIdCreator.firstButton.id
//        completeButton.hero.modifiers = [.fade]

        for subview in view.subviews {
            subview.hero.modifiers = [.fade, .scale(0.5)]
        }
    }
}
