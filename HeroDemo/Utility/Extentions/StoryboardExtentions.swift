//
//  UIStoryboardExtentions.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import UIKit

enum ViewControllerType: String {
    case transitionFirst
    case transitionSecond
    case animationsMenu
    case signIn
    case registrationFirst
    case registrationSecond
    case berlinOffice
    case berlinOfficeGrid
    case employeeDetail
    case employeeImage
}

extension UIStoryboard {
    static func create<T>(viewController: ViewControllerType) -> T? {
        let storyboard = UIStoryboard(name: viewController.rawValue.firstUppercased, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewController.rawValue) as? T
    }
}

