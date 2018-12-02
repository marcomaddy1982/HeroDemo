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

    func start(animated: Bool) {
        guard let animationsMenuViewController: AnimationsMenuViewController =
            UIStoryboard.create(viewController: .animationsMenu) else {
            return
        }
        animationsMenuViewController.delegate = self
        navigationController.hero.isEnabled = true
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.viewControllers = [animationsMenuViewController]
    }

    func cleanup(animated: Bool) {

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
        
    }

    private func showBerlinOffice() {
        guard let berlinOfficeViewController: BerlinOfficeViewController =
            UIStoryboard.create(viewController: .berlinOffice) else {
                return
        }
        berlinOfficeViewController.delegate = self
        navigationController.pushViewController(berlinOfficeViewController, animated: true)
    }
}

extension AnimationsMenuCoordinator: BerlinOfficeDelegate {
    func perform(action: BerlinOfficeAction) {
        switch action {
        case .showDetail(let employee):
            showEmployeeDetail(with: employee)
        }
    }

    private func showEmployeeDetail(with employee: Employee) {
        guard let employeeDetailViewController: EmployeeDetailViewController =
            UIStoryboard.create(viewController: .employeeDetail) else {
                return
        }
        employeeDetailViewController.employee = employee
        navigationController.pushViewController(employeeDetailViewController, animated: true)
    }
}
