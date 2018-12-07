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
    }
}

extension RegistrationSecondViewController {
    static func create() -> RegistrationSecondViewController {
        guard let registrationSecondViewController: RegistrationSecondViewController =
            UIStoryboard.create(viewController: .registrationSecond) else {
                return RegistrationSecondViewController()
        }

        return registrationSecondViewController
    }
}
