//
//  AnimationsMenuCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit
import Hero

final class AnimationsMenuCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController = UINavigationController()

    func start() {
        showAnimationsMenu()
    }
}

extension AnimationsMenuCoordinator {
    private func showAnimationsMenu() {
        let animationsMenuViewController = AnimationsMenuViewController.create()
        animationsMenuViewController.delegate = self
        navigationController.hero.isEnabled = true
        /* The following line could be commented since when hero.isEnabled = true the default navigation transition is the following. */
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.viewControllers = [animationsMenuViewController]
    }
}

extension AnimationsMenuCoordinator: TabCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}

extension AnimationsMenuCoordinator: AnimationsMenuDelegate {
    func perform(action: AnimationsMenuAction) {
        switch action {
        case .showRegistrationFlow:
            showRegistrationFlow()
        case .showBerlinOffice:
            showBerlinOffice()
        }
    }

    private func showRegistrationFlow() {
        childCoordinators.removeAll()
        let registrationFlowCoordinator = RegistrationFlowCoordinator(navigationController: navigationController)
        registrationFlowCoordinator.start()
        childCoordinators.append(registrationFlowCoordinator)
    }

    private func showBerlinOffice() {
        childCoordinators.removeAll()
        let berlinOfficeCoordinator = BerlinOfficeCoordinator(navigationController: navigationController)
        berlinOfficeCoordinator.start()
        childCoordinators.append(berlinOfficeCoordinator)
    }
}
