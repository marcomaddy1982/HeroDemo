//
//  AnimationsCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit
import Hero

final class AnimationsCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []
    private var navigationController = UINavigationController()

    func start(animated: Bool) {
        guard let animationViewController: AnimationViewController =
            UIStoryboard.create(viewController: .animation) else {
            return
        }
        animationViewController.delegate = self
        navigationController.viewControllers = [animationViewController]
    }

    func cleanup(animated: Bool) { }
}

extension AnimationsCoordinator: TabCoordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
}

extension AnimationsCoordinator: AnimationDelegate {
    func perform(action: AnimationAction) {
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
        guard let next: AnimationSecondViewController =
            UIStoryboard.create(viewController: .animationSecond) else {
                return
        }

        navigationController.pushViewController(next, animated: true)
    }
}

