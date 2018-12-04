//
//  HeroIdCreator.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

enum HeroIdCreator {
    case employeeImage(id: String)
    case employeeName(id: String)
    case employeeLastName(id: String)
    case employeeRole(id: String)
    case firstLabel
    case firstTextfield
    case secondLabel
    case secondTextfield
    case thirdLabel
    case thirdTextfield
    case firstButton

    var id: String {
        switch self {
        case .employeeImage(let id):
            return "image_\(id)"
        case .employeeName(let id):
            return "name_\(id)"
        case .employeeLastName(let id):
            return "lastname_\(id)"
        case .employeeRole(let id):
            return "role_\(id)"
        case .firstLabel:
            return "firstLabel"
        case .firstTextfield:
            return "firstTextfield"
        case .secondLabel:
            return "secondLabel"
        case .secondTextfield:
            return "secondTextfield"
        case .thirdLabel:
            return "thirdLabel"
        case .thirdTextfield:
            return "thirdTextfield"
        case .firstButton:
            return "firstButton"
        }
    }
}
