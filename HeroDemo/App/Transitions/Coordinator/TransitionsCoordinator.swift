//
//  TransitionsCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

final class TransitionsCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController = UINavigationController()

    func start(animated: Bool) {
        guard let transitionViewController: TransitionsViewController =
            UIStoryboard.create(viewController: .transitions) else {
            return
        }

        navigationController.viewControllers = [transitionViewController]
    }

    func cleanup(animated: Bool) {

    }
}

extension TransitionsCoordinator: TabCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}
