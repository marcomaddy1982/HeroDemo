//
//  UIStoryboardExtentions.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

enum ViewControllerType: String {
    case animationsMenu
    case berlinOffice
    case employeeDetail
    case animation
    case animationSecond
}

extension UIStoryboard {
    static func create<T>(viewController: ViewControllerType) -> T? {
        let storyboard = UIStoryboard(name: viewController.rawValue.firstUppercased, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewController.rawValue) as? T
    }
}

