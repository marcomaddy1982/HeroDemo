//
//  BerlinOfficeCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 05.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

final class BerlinOfficeCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showBerlinOffice()
    }
}

extension BerlinOfficeCoordinator {
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

extension BerlinOfficeCoordinator: BerlinOfficeDelegate {
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

extension BerlinOfficeCoordinator: BerlinOfficeGridDelegate {
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
