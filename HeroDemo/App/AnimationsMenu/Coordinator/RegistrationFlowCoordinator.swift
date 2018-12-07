//
//  RegistrationFlowCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 05.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

final class RegistrationFlowCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showRegistrationFlow()
    }
}

extension RegistrationFlowCoordinator {
    private func showRegistrationFlow() {
        let signInViewController = SignInViewController.create()
        signInViewController.delegate = self
        navigationController.pushViewController(signInViewController, animated: true)
    }
}

extension RegistrationFlowCoordinator: SignInDelegate {
    func perform(action: SignInAction) {
        switch action {
        case .showRegistration:
            showRegistrationFirst()
        }
    }

    private func showRegistrationFirst() {
        let registrationFirstViewController = RegistrationFirstViewController.create()
        registrationFirstViewController.delegate = self
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.pushViewController(registrationFirstViewController, animated: true)
    }
}

extension RegistrationFlowCoordinator: RegistrationFirstDelegate {
    func perform(action: RegistrationFirstAction) {
        switch action {
        case .showRegistrationSecond:
            showRegistrtionSecond()
        }
    }

    private func showRegistrtionSecond() {
        let registrationSecondViewController = RegistrationSecondViewController.create()
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .fade)
        navigationController.pushViewController(registrationSecondViewController, animated: true)
    }
}

