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
        phoneTextfield.hero.id = HeroIdCreator.firstTextfield.id
        emailLabel.hero.id = HeroIdCreator.secondLabel.id
        emailTextfield.hero.id = HeroIdCreator.secondTextfield.id
        pinLabel.hero.id = HeroIdCreator.secondLabel.id
        pinTextfield.hero.id = HeroIdCreator.secondTextfield.id
        completeButton.hero.id = HeroIdCreator.firstButton.id

        for subview in view.subviews {
            subview.hero.modifiers = [.fade]
        }
    }
}
