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
        guard let animationsMenuViewController: AnimationsMenuViewController =
            UIStoryboard.create(viewController: .animationsMenu) else {
            return
        }
        animationsMenuViewController.delegate = self
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        navigationController.hero.isEnabled = true
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
        guard let signInViewController: SignInViewController =
            UIStoryboard.create(viewController: .signIn) else {
                return
        }
        signInViewController.delegate = self
        navigationController.pushViewController(signInViewController, animated: true)
    }

    private func showBerlinOffice() {
        guard let berlinOfficeViewController: BerlinOfficeViewController =
            UIStoryboard.create(viewController: .berlinOffice) else {
                return
        }
        berlinOfficeViewController.delegate = self
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.pushViewController(berlinOfficeViewController, animated: true)
    }
}

extension AnimationsMenuCoordinator: BerlinOfficeDelegate {
    func perform(action: BerlinOfficeAction) {
        switch action {
        case .showDetail(let employee):
            showEmployeeDetail(with: employee)
        case .showGrid(let berlinOfficeVC, let employees):
            showBerlinOfficeGrid(from: berlinOfficeVC, with: employees)
        }
    }

    private func showEmployeeDetail(with employee: Employee) {
        guard let employeeDetailViewController: EmployeeDetailViewController =
            UIStoryboard.create(viewController: .employeeDetail) else {
                return
        }
        employeeDetailViewController.employee = employee
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.pushViewController(employeeDetailViewController, animated: true)
    }

    private func showBerlinOfficeGrid(from berlinOfficeVC: BerlinOfficeViewController,
                                      with employees: [Employee]) {
        guard let berlinOfficeGridViewController: BerlinOfficeGridViewController =
            UIStoryboard.create(viewController: .berlinOfficeGrid) else {
                return
        }

        berlinOfficeGridViewController.delegate = self
        berlinOfficeGridViewController.employees = employees
        // Replace the current view controller with another VC on the navigation/modal stack.
        berlinOfficeVC.hero.replaceViewController(with: berlinOfficeGridViewController)
    }
}

extension AnimationsMenuCoordinator: BerlinOfficeGridDelegate {
    func perform(action: BerlinOfficeGridAction) {
        switch action {
        case .showList(let berlinOfficeGridVC):
            showBerlinOffice(from: berlinOfficeGridVC)
        case .showEmployeeImage(let berlinOfficeGridVC, let employee):
            showEmployeeImage(from: berlinOfficeGridVC, employee: employee)
        }
    }

    private func showBerlinOffice(from berlinOfficeGridVC: BerlinOfficeGridViewController){
        guard let berlinOfficeViewController: BerlinOfficeViewController =
            UIStoryboard.create(viewController: .berlinOffice) else {
                return
        }
        berlinOfficeViewController.delegate = self
        // Replace the current view controller with another VC on the navigation/modal stack.
        berlinOfficeGridVC.hero.replaceViewController(with: berlinOfficeViewController)
    }

    private func showEmployeeImage(from berlinOfficeGridVC: BerlinOfficeGridViewController, employee: Employee) {
        guard let employeeImageViewController: EmployeeImageViewController =
            UIStoryboard.create(viewController: .employeeImage) else {
                return
        }
        employeeImageViewController.employee = employee
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .fade)
        navigationController.pushViewController(employeeImageViewController, animated: true)
    }
}

extension AnimationsMenuCoordinator: SignInDelegate {
    func perform(action: SignInAction) {
        switch action {
        case .showRegistration:
            showRegistrationFirst()
        }
    }

    private func showRegistrationFirst() {
        guard let registrationFirstViewController: RegistrationFirstViewController =
            UIStoryboard.create(viewController: .registrationFirst) else {
                return
        }
        registrationFirstViewController.delegate = self
        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .push(direction: .left))
        navigationController.pushViewController(registrationFirstViewController, animated: true)
    }
}

extension AnimationsMenuCoordinator: RegistrationFirstDelegate {
    func perform(action: RegistrationFirstAction) {
        switch action {
        case .showRegistrationSecond:
            showRegistrtionSecond()
        }
    }

    private func showRegistrtionSecond() {
        guard let registrationSecondViewController: RegistrationSecondViewController =
            UIStoryboard.create(viewController: .registrationSecond) else {
                return
        }

        navigationController.hero.navigationAnimationType = .autoReverse(presenting: .fade)
        navigationController.pushViewController(registrationSecondViewController, animated: true)
    }
}
