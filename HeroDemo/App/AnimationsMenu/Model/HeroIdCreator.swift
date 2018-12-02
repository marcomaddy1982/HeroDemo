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
        }
    }
}
