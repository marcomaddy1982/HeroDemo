//
//  Coordinator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//


protocol Coordinator {
    func start(animated: Bool)
    func cleanup(animated: Bool)
}

extension Coordinator {
    var childCoordinators: [Coordinator] {
        get {
            return []
        }
        set {
        }
    }
}
