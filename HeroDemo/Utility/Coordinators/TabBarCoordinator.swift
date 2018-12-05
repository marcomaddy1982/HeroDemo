//
//  TabBarCoordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

protocol TabCoordinator {
    var rootViewController: UIViewController { get }
}

enum Tab {
    case transitions
    case animations
}

extension Tab {
    static var all: [Tab] {
        return [transitions, .animations]
    }
}

extension Tab {
    var tabBarItem: UITabBarItem {
        switch self {
        case .transitions:
            return UITabBarItem(title: "Transitions", image: nil, tag: 0)
        case .animations:
            return UITabBarItem(title: "Animations", image: nil, tag: 1)
        }
    }
}

final class TabBarCoordinator: Coordinator {
    private let window: UIWindow
    private var childCoordinators: [Tab: TabCoordinator & Coordinator] = [:]
    private let tabBarController = UITabBarController()

    // MARK: - Initialization

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        tabBarController.view.tintColor = UIColor.gray
//      Uncomment to show tab controller fade animation.
//        tabBarController.hero.isEnabled = true
//        tabBarController.hero.tabBarAnimationType = .fade

        Tab.all.forEach {
            let coordinator = tabCoordinator(for: $0)
            coordinator.rootViewController.tabBarItem = $0.tabBarItem
            coordinator.start()
            childCoordinators[$0] = coordinator
        }

        tabBarController.viewControllers = Tab.all.compactMap { childCoordinators[$0]?.rootViewController }
        tabBarController.selectedIndex = 0

        window.rootViewController = tabBarController
    }

    func switchTab(toTab: Tab) {
        switch toTab {
        case .transitions:
            tabBarController.selectedIndex = 0
        case .animations:
            tabBarController.selectedIndex = 1
        }
    }

    private func tabCoordinator(for tab: Tab) -> Coordinator & TabCoordinator {
        switch tab {
        case .transitions:
            return TransitionsCoordinator()
        case .animations:
            return AnimationsMenuCoordinator()
        }
    }
}

