//
//  SignInViewController.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 04.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol SignInDelegate: AnyObject {
    func perform(action: SignInAction)
}

enum SignInAction {
    case showRegistration
}

class SignInViewController: UIViewController {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var usernameTextfield: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!

    weak var delegate: SignInDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        setUpHeroIds()
    }

    @IBAction private func registerButtonDidPress(_ sender: UIButton) {
        delegate?.perform(action: .showRegistration)
    }

    private func setUpHeroIds() {
        usernameLabel.hero.id = HeroIdCreator.firstLabel.id
        usernameTextfield.hero.id = HeroIdCreator.firstTextfield.id
        passwordLabel.hero.id = HeroIdCreator.secondLabel.id
        passwordTextfield.hero.id = HeroIdCreator.secondTextfield.id
        registerButton.hero.id = HeroIdCreator.firstButton.id
    }
}

extension SignInViewController {
    static func create() -> SignInViewController {
        guard let signInViewController: SignInViewController =
            UIStoryboard.create(viewController: .signIn) else {
                return SignInViewController()
        }

        return signInViewController
    }
}
