//
//  TransitionsCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit
import Hero

final class TransitionsCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController = UINavigationController()

    func start() {
        guard let transitionFirstViewController: TransitionFirstViewController =
            UIStoryboard.create(viewController: .transitionFirst) else {
            return
        }
        transitionFirstViewController.delegate = self
        navigationController.viewControllers = [transitionFirstViewController]
    }
}

extension TransitionsCoordinator: TabCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}

extension TransitionsCoordinator: TransitionFirstDelegate {
    func perform(action: TransitionFirstAction) {
        switch action {
        case .heroAnimation(let isEnabled):
//            uncomment the following code to configure different animation type
            navigationController.hero.navigationAnimationType = .autoReverse(presenting: .zoom)
            navigationController.hero.isEnabled = isEnabled
        case .next:
            showNext()
        }
    }

    private func showNext() {
        guard let next: TransitionSecondViewController =
            UIStoryboard.create(viewController: .transitionSecond) else {
                return
        }

        navigationController.pushViewController(next, animated: true)
    }
}

