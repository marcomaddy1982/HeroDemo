//
//  RegistrationStep1ViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 03.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol RegistrationFirstDelegate: AnyObject {
    func perform(action: RegistrationFirstAction)
}

enum RegistrationFirstAction {
    case showRegistrationSecond
}

class RegistrationFirstViewController: UIViewController {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var confirmPasswordLabel: UILabel!
    @IBOutlet private weak var confirmPasswordTextfield: UITextField!
    @IBOutlet private weak var continueButton: UIButton!

    weak var delegate: RegistrationFirstDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration Step 1"
        setUpHeroIds()
    }

    @IBAction private func continueButtonDidPress(_ sender: UIButton) {
        delegate?.perform(action: .showRegistrationSecond)
    }

    private func setUpHeroIds() {
        usernameLabel.hero.id = HeroIdCreator.firstLabel.id
        usernameTextfield.hero.id = HeroIdCreator.firstTextfield.id
        passwordLabel.hero.id = HeroIdCreator.secondLabel.id
        passwordTextfield.hero.id = HeroIdCreator.secondTextfield.id
        confirmPasswordLabel.hero.id = HeroIdCreator.secondLabel.id
        confirmPasswordTextfield.hero.id = HeroIdCreator.secondTextfield.id
        continueButton.hero.id = HeroIdCreator.firstButton.id
    }
}
