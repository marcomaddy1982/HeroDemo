//
//  BerlinOffice.swift
//  HeroDemo
//
//  Created by Marco Maddalena on 02.12.18.
//  Copyright © 2018 Intive. All rights reserved.
//

import Foundation

struct BerlinOffice: Codable {
    let employees: [Employee]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        employees = try container.decode([Employee].self, forKey: .employees)
    }

    init() {
        employees = []
    }
}

struct Employee: Codable {
    let id: String
    let imageName: String
    let name: String
    let lastName: String
    let role: String

    init() {
        id = "xxx"
        imageName = "xxx"
        name = "xxx"
        lastName = "xxx"
        role = "xxx"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        imageName = try container.decode(String.self, forKey: .imageName)
        name = try container.decode(String.self, forKey: .name)
        lastName = try container.decode(String.self, forKey: .lastName)
        role = try container.decode(String.self, forKey: .role)
    }
}

// MARK: - Load

extension BerlinOffice {
    public static func load() -> BerlinOffice? {
        let url = Bundle.main.url(forResource: "BerlinOffice", withExtension: "plist")!

        guard
            let data = try? Data(contentsOf: url),
            let berlinOffice = try? PropertyListDecoder().decode(BerlinOffice.self, from: data)
        else {
            return nil
        }
        return berlinOffice
    }
}
